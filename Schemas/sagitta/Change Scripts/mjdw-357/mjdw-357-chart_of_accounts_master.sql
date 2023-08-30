/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.chart_of_accounts_master 
	 DROP CONSTRAINT IF EXISTS chart_of_accounts_master_pkey 
	,ADD CONSTRAINT chart_of_accounts_master_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.chart_of_accounts_master; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.chart_of_accounts_master; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.chart_of_accounts_master; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.chart_of_accounts_master; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.chart_of_accounts_master FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'chart_of_accounts_master' 			AS table_name 
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
						,x.old_audit_effective_dt 			AS audit_effective_dt 
						,x.old_audit_change_agency_id 			AS audit_change_agency_id 
						,x.old_description 			AS description 
						,x.old_normal_balance_amt 			AS normal_balance_amt 
						,x.old_ledger_type_cd 			AS ledger_type_cd 
						,x.old_period_end_dt 			AS period_end_dt 
						,x.old_close_to_account 			AS close_to_account 
						,x.old_report_cd 			AS report_cd 
						,x.old_base_pct 			AS base_pct 
						,x.old_allocated_by 			AS allocated_by 
						,x.old_gl_account_number 			AS gl_account_number 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_chart_of_accounts_master 	AS x 
	INNER JOIN 	sagitta.chart_of_accounts_master 	AS y 
		ON x.sagitem = y.sagitem; 
GO 
