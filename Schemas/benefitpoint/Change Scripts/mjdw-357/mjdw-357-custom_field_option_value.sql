/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.custom_field_option_value 
	 DROP CONSTRAINT IF EXISTS custom_field_option_value_pkey 
	,ADD CONSTRAINT custom_field_option_value_cfov_source_uq 	UNIQUE (cfov_source)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.custom_field_option_value; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.custom_field_option_value; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.custom_field_option_value; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.custom_field_option_value; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.custom_field_option_value FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'custom_field_option_value' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.cfov_source
						,x.source_key
						,x.custom_field_option_value_id
						,x.old_description 			AS description 
						,x.old_active 			AS active 
						,x.old_sort_order 			AS sort_order 
						,x.old_default_option_value 			AS default_option_value 
						,x.old_code 			AS code 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_custom_field_option_value 	AS x 
	INNER JOIN 	benefitpoint.custom_field_option_value 	AS y 
		ON x.cfov_source = y.cfov_source
			 AND x.source_key = y.source_key
			 AND x.custom_field_option_value_id = y.custom_field_option_value_id; 
GO 
