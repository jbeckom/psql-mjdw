/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.clients_addlinfo 
	 DROP CONSTRAINT IF EXISTS clients_addlinfo_pkey 
	,ADD CONSTRAINT clients_addlinfo_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.clients_addlinfo; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.clients_addlinfo; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.clients_addlinfo; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.clients_addlinfo; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.clients_addlinfo FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'clients_addlinfo' 			AS table_name 
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
						,x.old_serv_4 			AS serv_4 
						,x.old_serv_5 			AS serv_5 
						,x.old_client_exec 			AS client_exec 
						,x.old_prod_4 			AS prod_4 
						,x.old_prod_5 			AS prod_5 
						,x.old_budgeted_revenue 			AS budgeted_revenue 
						,x.old_invoice_contact 			AS invoice_contact 
						,x.old_rewrite 			AS rewrite 
						,x.old_invoice_email_address 			AS invoice_email_address 
						,x.old_invoice_fax_number 			AS invoice_fax_number 
						,x.old_industry_segment 			AS industry_segment 
						,x.old_mc_number 			AS mc_number 
						,x.old_dot_number 			AS dot_number 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_clients_addlinfo 	AS x 
	INNER JOIN 	sagitta.clients_addlinfo 	AS y 
		ON x.sagitem = y.sagitem; 
GO 
