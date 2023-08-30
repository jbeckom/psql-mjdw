/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.additional_product_info 
	 DROP CONSTRAINT IF EXISTS additional_product_info_pkey 
	,ADD CONSTRAINT additional_product_info_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.additional_product_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.additional_product_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.additional_product_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.additional_product_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.additional_product_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'additional_product_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.old_estimated_commission 			AS estimated_commission 
						,x.old_commission_period_type 			AS commission_period_type 
						,x.old_notes 			AS notes 
						,x.old_requires_5500 			AS requires_5500 
						,x.old_erisa_plan 			AS erisa_plan 
						,x.old_erisa_plan_year_end_month 			AS erisa_plan_year_end_month 
						,x.old_erisa_plan_year_end_day 			AS erisa_plan_year_end_day 
						,x.old_alternative_plan_id 			AS alternative_plan_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_additional_product_info 	AS x 
	INNER JOIN 	benefitpoint.additional_product_info 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id; 
GO 
