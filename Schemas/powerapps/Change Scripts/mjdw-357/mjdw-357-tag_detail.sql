/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.tag_detail 
	 DROP CONSTRAINT IF EXISTS tag_detail_pkey 
	,ADD CONSTRAINT tag_detail_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.tag_detail; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.tag_detail; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.tag_detail; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.tag_detail; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.tag_detail FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
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
		,'tag_detail' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.guid
						,x.old_tag_name 			AS tag_name 
						,x.old_tag_type 			AS tag_type 
						,x.old_tag_owner 			AS tag_owner 
						,x.old_status 			AS status 
						,x.old_modify_dt 			AS modify_dt 
						,x.old_is_dirty 			AS is_dirty 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_tag_detail 	AS x 
	INNER JOIN 	powerapps.tag_detail 	AS y 
		ON x.guid = y.guid; 
GO 
