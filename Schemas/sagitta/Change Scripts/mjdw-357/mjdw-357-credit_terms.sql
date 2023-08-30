/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.credit_terms 
	 DROP CONSTRAINT IF EXISTS credit_terms_pkey 
	,ADD CONSTRAINT credit_terms_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.credit_terms; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.credit_terms; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.credit_terms; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.credit_terms; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.credit_terms FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'credit_terms' 			AS table_name 
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
						,x.old_credit_terms_description 			AS credit_terms_description 
						,x.old_due_days 			AS due_days 
						,x.old_percent 			AS percent 
						,x.old_date_off 			AS date_off 
						,x.old_date_off_remarks 			AS date_off_remarks 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_credit_terms 	AS x 
	INNER JOIN 	sagitta.credit_terms 	AS y 
		ON x.sagitem = y.sagitem; 
GO 
