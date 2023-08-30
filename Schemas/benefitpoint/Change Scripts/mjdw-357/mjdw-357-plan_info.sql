/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.plan_info 
	 DROP CONSTRAINT IF EXISTS plan_info_pkey 
	,ADD CONSTRAINT plan_info_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.plan_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.plan_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.plan_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.plan_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.plan_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.benefitpoint_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'plan_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.old_alternative_plan_id 			AS alternative_plan_id 
						,x.old_erisa_plan 			AS erisa_plan 
						,x.old_erisa_plan_year_end_month 			AS erisa_plan_year_end_month 
						,x.old_erisa_plan_year_end_day 			AS erisa_plan_year_end_day 
						,x.old_notes 			AS notes 
						,x.old_frozen_enrollment 			AS frozen_enrollment 
						,x.old_requires_5500 			AS requires_5500 
						,x.old_frozen_enrollment_effective_as_of 			AS frozen_enrollment_effective_as_of 
						,x.old_market_size 			AS market_size 
						,x.old_maxiumum_group_size 			AS maxiumum_group_size 
						,x.old_minimum_group_size 			AS minimum_group_size 
						,x.old_exclusions_limitations 			AS exclusions_limitations 
						,x.old_customizations 			AS customizations 
						,x.old_participation_requirements 			AS participation_requirements 
						,x.old_participation_requirements_vol 			AS participation_requirements_vol 
						,x.old_state_list 			AS state_list 
						,x.old_market_group_plan_id 			AS market_group_plan_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_plan_info 	AS x 
	INNER JOIN 	benefitpoint.plan_info 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id; 
GO 
