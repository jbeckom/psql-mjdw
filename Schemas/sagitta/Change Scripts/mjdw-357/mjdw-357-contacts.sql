/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.contacts 
	 DROP CONSTRAINT IF EXISTS contacts_pkey 
	,ADD CONSTRAINT contacts_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.contacts; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.contacts; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.contacts; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.contacts; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.contacts FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'contacts' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.old_audit_staff_cd 			AS audit_staff_cd 
						,x.old_audit_entry_dt 			AS audit_entry_dt 
						,x.old_audit_time 			AS audit_time 
						,x.old_audit_cd 			AS audit_cd 
						,x.old_audit_history_record_number 			AS audit_history_record_number 
						,x.old_audit_program 			AS audit_program 
						,x.old_client_id 			AS client_id 
						,x.old_contact_type_cd 			AS contact_type_cd 
						,x.old_given_name 			AS given_name 
						,x.old_other_given_name 			AS other_given_name 
						,x.old_surname 			AS surname 
						,x.old_suffix 			AS suffix 
						,x.old_salutation 			AS salutation 
						,x.old_birth_dt 			AS birth_dt 
						,x.old_spouse 			AS spouse 
						,x.old_profession 			AS profession 
						,x.old_title 			AS title 
						,x.old_company 			AS company 
						,x.old_sex_cd 			AS sex_cd 
						,x.old_office_location 			AS office_location 
						,x.old_comments 			AS comments 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_contacts 	AS x 
	INNER JOIN 	sagitta.contacts 	AS y 
		ON x.sagitem = y.sagitem; 
GO 
