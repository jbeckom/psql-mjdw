/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.tam_customer 
	 DROP CONSTRAINT IF EXISTS tam_customer_pkey 
	,ADD CONSTRAINT tam_customer_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.tam_customer; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.tam_customer; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.tam_customer; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.tam_customer; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.tam_customer FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'tam_customer' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.customer_code
						,x.old_customer_class_code 			AS customer_class_code 
						,x.old_branch_code 			AS branch_code 
						,x.old_agency_code 			AS agency_code 
						,x.old_branch_name 			AS branch_name 
						,x.old_agency_name 			AS agency_name 
						,x.old_office_id 			AS office_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_tam_customer 	AS x 
	INNER JOIN 	benefitpoint.tam_customer 	AS y 
		ON x.account_id = y.account_id
			 AND x.customer_code = y.customer_code; 
GO 
