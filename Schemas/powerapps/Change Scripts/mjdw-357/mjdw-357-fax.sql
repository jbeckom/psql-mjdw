/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE powerapps.fax 
	 DROP CONSTRAINT IF EXISTS fax_pkey 
	,ADD CONSTRAINT fax_guid_uq 	UNIQUE (guid)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON powerapps.fax; 
GO
DROP TRIGGER IF EXISTS audit_i ON powerapps.fax; 
GO
DROP TRIGGER IF EXISTS audit_u ON powerapps.fax; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON powerapps.fax; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON powerapps.fax FOR EACH ROW EXECUTE FUNCTION audit.tr_powerapps_log_change(); 
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
		,'fax' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.guid
						,x.old_fax_type 			AS fax_type 
						,x.old_fax 			AS fax 
						,x.old_fax_owner 			AS fax_owner 
						,x.old_status 			AS status 
						,x.old_status_reason 			AS status_reason 
			) 	AS _ 
		) 			AS new_record 
FROM powerapps.audit_fax 	AS x 
	INNER JOIN 	powerapps.fax 	AS y 
		ON x.guid = y.guid; 
GO 
