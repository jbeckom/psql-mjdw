/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.insurors_alternate_contact_info 
	 DROP CONSTRAINT IF EXISTS insurors_alternate_contact_info_pkey 
	,ADD CONSTRAINT insurors_alternate_contact_info_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.insurors_alternate_contact_info; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.insurors_alternate_contact_info; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.insurors_alternate_contact_info; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.insurors_alternate_contact_info; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.insurors_alternate_contact_info FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'insurors_alternate_contact_info' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_alternate_contact_type_cd 			AS alternate_contact_type_cd 
						,x.old_alternate_contact_name 			AS alternate_contact_name 
						,x.old_alternate_contact_addr_1 			AS alternate_contact_addr_1 
						,x.old_alternate_contact_postal_code 			AS alternate_contact_postal_code 
						,x.old_alternate_contact_postal_extension_code 			AS alternate_contact_postal_extension_code 
						,x.old_alternate_contact_city 			AS alternate_contact_city 
						,x.old_alternate_contact_state_prov_cd 			AS alternate_contact_state_prov_cd 
						,x.old_alternate_contact_salutation 			AS alternate_contact_salutation 
						,x.old_alternate_contact_phone_number 			AS alternate_contact_phone_number 
						,x.old_alternate_contact_phone_extension_number 			AS alternate_contact_phone_extension_number 
						,x.old_alternate_contact_addr_2 			AS alternate_contact_addr_2 
						,x.old_contact_fax_number 			AS contact_fax_number 
						,x.old_email_addr 			AS email_addr 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_insurors_alternate_contact_info 	AS x 
	INNER JOIN 	sagitta.insurors_alternate_contact_info 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
