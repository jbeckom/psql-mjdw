/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.license 
	 DROP CONSTRAINT IF EXISTS license_pkey 
	,ADD CONSTRAINT license_license_source_uq 	UNIQUE (license_source)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.license; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.license; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.license; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.license; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.license FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'license' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.license_source
						,x.source_key
						,x.license_id
						,x.old_state 			AS state 
						,x.old_license_number 			AS license_number 
						,x.old_residence_license 			AS residence_license 
						,x.old_license_on 			AS license_on 
						,x.old_license_expires_on 			AS license_expires_on 
						,x.old_e_and_o_expires_on 			AS e_and_o_expires_on 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_license 	AS x 
	INNER JOIN 	benefitpoint.license 	AS y 
		ON x.license_source = y.license_source
			 AND x.source_key = y.source_key
			 AND x.license_id = y.license_id; 
GO 
