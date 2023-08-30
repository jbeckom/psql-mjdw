/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.contact 
	 DROP CONSTRAINT IF EXISTS contact_pkey 
	,ADD CONSTRAINT contact_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.contact; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.contact; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.contact; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.contact; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.contact FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.powerapps_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'contact' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.guid
						,x.old_master_contact 			AS master_contact 
						,x.old_first_name 			AS first_name 
						,x.old_last_name 			AS last_name 
						,x.old_contact_type 			AS contact_type 
						,x.old_parent_account_guid 			AS parent_account_guid 
						,x.old_job_title 			AS job_title 
						,x.old_preferred_contact 			AS preferred_contact 
						,x.old_gender 			AS gender 
						,x.old_family_status 			AS family_status 
						,x.old_spouse_name 			AS spouse_name 
						,x.old_dob 			AS dob 
						,x.old_anniversary 			AS anniversary 
						,x.old_allow_email 			AS allow_email 
						,x.old_follow_email 			AS follow_email 
						,x.old_allow_bulk_email 			AS allow_bulk_email 
						,x.old_allow_phone 			AS allow_phone 
						,x.old_allow_fax 			AS allow_fax 
						,x.old_allow_mail 			AS allow_mail 
						,x.old_description 			AS description 
						,x.old_contact_owner 			AS contact_owner 
						,x.old_status 			AS status 
						,x.old_status_reason 			AS status_reason 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_contact 	AS x 
	INNER JOIN 	powerapps.contact 	AS y 
		ON x.guid = y.guid; 
GO 
