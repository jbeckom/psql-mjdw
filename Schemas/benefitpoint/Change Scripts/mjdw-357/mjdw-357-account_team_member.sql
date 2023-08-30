/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE benefitpoint.account_team_member 
	 DROP CONSTRAINT IF EXISTS account_team_member_pkey 
	,ADD CONSTRAINT account_team_member_account_id_uq 	UNIQUE (account_id)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON benefitpoint.account_team_member; 
GO
DROP TRIGGER IF EXISTS audit_i ON benefitpoint.account_team_member; 
GO
DROP TRIGGER IF EXISTS audit_u ON benefitpoint.account_team_member; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON benefitpoint.account_team_member; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON benefitpoint.account_team_member FOR EACH ROW EXECUTE FUNCTION audit.tr_benefitpoint_log_change(); 
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
		,'account_team_member' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.account_id
						,x.user_id
						,x.old_first_name 			AS first_name 
						,x.old_last_name 			AS last_name 
						,x.old_email 			AS email 
						,x.old_broker_client_role_id 			AS broker_client_role_id 
						,x.old_administrator 			AS administrator 
						,x.old_primary_contact 			AS primary_contact 
						,x.old_office 			AS office 
						,x.old_team_role_primary 			AS team_role_primary 
			) 	AS _ 
		) 			AS new_record 
FROM benefitpoint.audit_account_team_member 	AS x 
	INNER JOIN 	benefitpoint.account_team_member 	AS y 
		ON x.account_id = y.account_id
			 AND x.user_id = y.user_id; 
GO 
