/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.account_integration_info 
	 DROP CONSTRAINT IF EXISTS account_integration_info_pkey 
	,ADD CONSTRAINT account_integration_info_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.account_integration_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.account_integration_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.account_integration_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.account_integration_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.account_integration_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'account_integration_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.old_source_code 			AS source_code 
						,x.old_primary_sales_lead_int_code 			AS primary_sales_lead_int_code 
						,x.old_primary_service_lead_int_code 			AS primary_service_lead_int_code 
						,x.old_ams_customer_id 			AS ams_customer_id 
						,x.old_ams_customer_number 			AS ams_customer_number 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_account_integration_info 	AS x 
	INNER JOIN 	benefitpoint.account_integration_info 	AS y 
		ON x.account_id = y.account_id; 
GO 
