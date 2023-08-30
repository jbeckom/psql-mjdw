/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.company_payee 
	 DROP CONSTRAINT IF EXISTS company_payee_pkey 
	,ADD CONSTRAINT company_payee_payee_id_uq 	UNIQUE (payee_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.company_payee; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.company_payee; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.company_payee; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.company_payee; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.company_payee FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'company_payee' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.payee_id
						,x.old_company_name 			AS company_name 
						,x.old_vendor_number 			AS vendor_number 
						,x.old_website 			AS website 
						,x.old_agency_account_id 			AS agency_account_id 
						,x.old_company_1099 			AS company_1099 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_company_payee 	AS x 
	INNER JOIN 	benefitpoint.company_payee 	AS y 
		ON x.payee_id = y.payee_id; 
GO 
