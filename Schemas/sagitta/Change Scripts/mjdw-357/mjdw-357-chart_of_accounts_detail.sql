/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.chart_of_accounts_detail 
	 DROP CONSTRAINT IF EXISTS chart_of_accounts_detail_pkey 
	,ADD CONSTRAINT chart_of_accounts_detail_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.chart_of_accounts_detail; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.chart_of_accounts_detail; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.chart_of_accounts_detail; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.chart_of_accounts_detail; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.chart_of_accounts_detail FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'chart_of_accounts_detail' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_journal_id 			AS journal_id 
						,x.old_debit_balance 			AS debit_balance 
						,x.old_credit_balance 			AS credit_balance 
						,x.old_memo_amt 			AS memo_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_chart_of_accounts_detail 	AS x 
	INNER JOIN 	sagitta.chart_of_accounts_detail 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
