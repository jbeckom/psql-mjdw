/*** CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.rate_field_value 
	ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.rate_field_value; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.rate_field_value; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.rate_field_value; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.rate_field_value; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.rate_field_value FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'rate_field_value' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 						,x.old_multi_value_index 			AS multi_value_index 
						,x.old_value_num 			AS value_num 
						,x.old_value_text 			AS value_text 
						,x.old_age_band_index 			AS age_band_index 
						,x.old_age_band_gender 			AS age_band_gender 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_rate_field_value 	AS x 
	INNER JOIN 	benefitpoint.rate_field_value 	AS y 
		ON ; 
GO 
