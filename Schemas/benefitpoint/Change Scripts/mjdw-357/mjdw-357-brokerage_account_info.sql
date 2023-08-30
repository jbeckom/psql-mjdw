/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.brokerage_account_info 
	 DROP CONSTRAINT IF EXISTS brokerage_account_info_pkey 
	,ADD CONSTRAINT brokerage_account_info_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.brokerage_account_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.brokerage_account_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.brokerage_account_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.brokerage_account_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.brokerage_account_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'brokerage_account_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.account_type
						,x.old_account_number 			AS account_number 
						,x.old_broker_of_record_as_of 			AS broker_of_record_as_of 
						,x.old_hipaa_required 			AS hipaa_required 
						,x.old_hipaa_signed_on 			AS hipaa_signed_on 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_brokerage_account_info 	AS x 
	INNER JOIN 	benefitpoint.brokerage_account_info 	AS y 
		ON x.account_id = y.account_id
			 AND x.account_type = y.account_type; 
GO 
