/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.user 
	 DROP CONSTRAINT IF EXISTS user_pkey 
	,ADD CONSTRAINT user_id_uq 	UNIQUE (id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.user; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.user; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.user; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.user; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.user FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'user' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.id
						,x.old_username 			AS username 
						,x.old_first_name 			AS first_name 
						,x.old_last_name 			AS last_name 
						,x.old_title 			AS title 
						,x.old_office_id 			AS office_id 
						,x.old_last_modified_on 			AS last_modified_on 
						,x.old_last_login_on 			AS last_login_on 
						,x.old_last_lockout_on 			AS last_lockout_on 
						,x.old_roles 			AS roles 
						,x.old_created_on 			AS created_on 
						,x.old_notes 			AS notes 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_user 	AS x 
	INNER JOIN 	benefitpoint.user 	AS y 
		ON x.id = y.id; 
GO 
