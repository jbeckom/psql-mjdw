/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.contacts_address_group 
	 DROP CONSTRAINT IF EXISTS contacts_address_group_pkey 
	,ADD CONSTRAINT contacts_address_group_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.contacts_address_group; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.contacts_address_group; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.contacts_address_group; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.contacts_address_group; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.contacts_address_group FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
GO
 
/*** MOVE AUDIT DATA FROM LEGACY TABLE(S) TO NEW AUDIT SCHEMA ***/
INSERT INTO audit.sagitta_log (audit_time, audit_user, audit_client, operation, table_name, table_key, new_record) 
SELECT 	 x.audit_timestamp 			AS audit_time 
		,x.audit_user 			AS audit_user 
		,'0.0.0.0'::inet 			AS audit_client 
		,CASE 
			WHEN x.audit_action = 'D' THEN 'DELETE' 
			WHEN x.audit_action = 'I' THEN 'INSERT' 
			WHEN x.audit_action = 'U' THEN 'UPDATE' 
		END 			AS operation 
		,'contacts_address_group' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_type 			AS type 
						,x.old_address 			AS address 
						,x.old_address_2 			AS address_2 
						,x.old_zip 			AS zip 
						,x.old_zip_ext 			AS zip_ext 
						,x.old_city 			AS city 
						,x.old_state 			AS state 
						,x.old_country 			AS country 
						,x.old_primary 			AS primary 
						,x.old_preferred 			AS preferred 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_contacts_address_group 	AS x 
	INNER JOIN 	sagitta.contacts_address_group 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
