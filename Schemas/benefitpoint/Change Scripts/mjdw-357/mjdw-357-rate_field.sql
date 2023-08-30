/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.rate_field 
	 DROP CONSTRAINT IF EXISTS rate_field_pkey 
	,ADD CONSTRAINT rate_field_rate_field_id_uq 	UNIQUE (rate_field_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.rate_field; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.rate_field; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.rate_field; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.rate_field; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.rate_field FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'rate_field' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.rate_field_id
						,x.old_label 			AS label 
						,x.old_field_type 			AS field_type 
						,x.old_field_value_type 			AS field_value_type 
						,x.old_rate_field_group 			AS rate_field_group 
						,x.old_tiered 			AS tiered 
						,x.old_calculated 			AS calculated 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_rate_field 	AS x 
	INNER JOIN 	benefitpoint.rate_field 	AS y 
		ON x.rate_field_id = y.rate_field_id; 
GO 
