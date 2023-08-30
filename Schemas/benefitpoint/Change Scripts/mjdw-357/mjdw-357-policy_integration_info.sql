/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.policy_integration_info 
	 DROP CONSTRAINT IF EXISTS policy_integration_info_pkey 
	,ADD CONSTRAINT policy_integration_info_product_id_uq 	UNIQUE (product_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.policy_integration_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.policy_integration_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.policy_integration_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.policy_integration_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.policy_integration_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'policy_integration_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.product_id
						,x.account_id
						,x.old_sagitta_policy_id 			AS sagitta_policy_id 
						,x.old_ams_policy_id 			AS ams_policy_id 
						,x.old_tam_policy_id 			AS tam_policy_id 
						,x.old_vision_policy_id 			AS vision_policy_id 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_policy_integration_info 	AS x 
	INNER JOIN 	benefitpoint.policy_integration_info 	AS y 
		ON x.product_id = y.product_id
			 AND x.account_id = y.account_id; 
GO 
