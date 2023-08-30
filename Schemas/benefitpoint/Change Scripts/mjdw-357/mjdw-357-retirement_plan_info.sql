/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.retirement_plan_info 
	 DROP CONSTRAINT IF EXISTS retirement_plan_info_pkey 
	,ADD CONSTRAINT retirement_plan_info_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.retirement_plan_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.retirement_plan_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.retirement_plan_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.retirement_plan_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.retirement_plan_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'retirement_plan_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.old_record_keeper_plan_number 			AS record_keeper_plan_number 
						,x.old_plan_adoption_on 			AS plan_adoption_on 
						,x.old_fiscal_year_from 			AS fiscal_year_from 
						,x.old_fiscal_year_to 			AS fiscal_year_to 
						,x.old_audit_required 			AS audit_required 
						,x.old_auditor 			AS auditor 
						,x.old_trustee 			AS trustee 
						,x.old_custodian 			AS custodian 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_retirement_plan_info 	AS x 
	INNER JOIN 	benefitpoint.retirement_plan_info 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id; 
GO 
