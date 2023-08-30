/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.individual_payee 
	 DROP CONSTRAINT IF EXISTS individual_payee_pkey 
	,ADD CONSTRAINT individual_payee_payee_id_uq 	UNIQUE (payee_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.individual_payee; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.individual_payee; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.individual_payee; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.individual_payee; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.individual_payee FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'individual_payee' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.payee_id
						,x.old_tax_status 			AS tax_status 
						,x.old_company_name 			AS company_name 
						,x.old_department_code 			AS department_code 
						,x.old_employee_code 			AS employee_code 
						,x.old_agent_account_id 			AS agent_account_id 
						,x.old_user_id 			AS user_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_individual_payee 	AS x 
	INNER JOIN 	benefitpoint.individual_payee 	AS y 
		ON x.payee_id = y.payee_id; 
GO 
