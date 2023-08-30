/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.person_info 
	 DROP CONSTRAINT IF EXISTS person_info_pkey 
	,ADD CONSTRAINT person_info_person_source_uq 	UNIQUE (person_source)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.person_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.person_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.person_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.person_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.person_info FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'person_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.person_source
						,x.source_type
						,x.source_key
						,x.old_first_name 			AS first_name 
						,x.old_middle_name 			AS middle_name 
						,x.old_last_name 			AS last_name 
						,x.old_salutation 			AS salutation 
						,x.old_date_of_birth 			AS date_of_birth 
						,x.old_gender 			AS gender 
						,x.old_ssn 			AS ssn 
						,x.old_marital_status 			AS marital_status 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_person_info 	AS x 
	INNER JOIN 	benefitpoint.person_info 	AS y 
		ON x.person_source = y.person_source
			 AND x.source_type = y.source_type
			 AND x.source_key = y.source_key; 
GO 
