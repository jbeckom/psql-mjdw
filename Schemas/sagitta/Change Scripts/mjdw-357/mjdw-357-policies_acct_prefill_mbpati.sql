/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.policies_acct_prefill_mbpati 
	 DROP CONSTRAINT IF EXISTS policies_acct_prefill_mbpati_pkey 
	,ADD CONSTRAINT policies_acct_prefill_mbpati_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.policies_acct_prefill_mbpati; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.policies_acct_prefill_mbpati; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.policies_acct_prefill_mbpati; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.policies_acct_prefill_mbpati; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.policies_acct_prefill_mbpati FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'policies_acct_prefill_mbpati' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_billto 			AS billto 
						,x.old_billto_percent 			AS billto_percent 
						,x.old_billto_amount 			AS billto_amount 
						,x.old_ins 			AS ins 
						,x.old_payee 			AS payee 
						,x.old_payee_percent 			AS payee_percent 
						,x.old_payee_amt 			AS payee_amt 
						,x.old_agency_pct 			AS agency_pct 
						,x.old_agency_amt 			AS agency_amt 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_policies_acct_prefill_mbpati 	AS x 
	INNER JOIN 	sagitta.policies_acct_prefill_mbpati 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
