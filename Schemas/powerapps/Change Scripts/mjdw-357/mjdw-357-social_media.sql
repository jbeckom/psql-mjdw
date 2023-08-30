/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.social_media 
	 DROP CONSTRAINT IF EXISTS social_media_pkey 
	,ADD CONSTRAINT social_media_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.social_media; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.social_media; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.social_media; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.social_media; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.social_media FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
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
		,'social_media' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.guid
						,x.old_social_media_source 			AS social_media_source 
						,x.old_source_key 			AS source_key 
						,x.old_social_media_type 			AS social_media_type 
						,x.old_url 			AS url 
						,x.old_modify_dt 			AS modify_dt 
						,x.old_is_dirty 			AS is_dirty 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_social_media 	AS x 
	INNER JOIN 	powerapps.social_media 	AS y 
		ON x.guid = y.guid; 
GO 
