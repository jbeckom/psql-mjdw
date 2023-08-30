/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.policies_acct_prefill_ati 
	 DROP CONSTRAINT IF EXISTS policies_acct_prefill_ati_pkey 
	,ADD CONSTRAINT policies_acct_prefill_ati_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.policies_acct_prefill_ati; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.policies_acct_prefill_ati; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.policies_acct_prefill_ati; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.policies_acct_prefill_ati; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.policies_acct_prefill_ati FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'policies_acct_prefill_ati' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_transaction_cd 			AS transaction_cd 
						,x.old_transaction_cov_cd 			AS transaction_cov_cd 
						,x.old_transaction_payee_cd 			AS transaction_payee_cd 
						,x.old_transaction_amt 			AS transaction_amt 
						,x.old_transaction_prorated_repeated 			AS transaction_prorated_repeated 
						,x.old_transaction_admitted_yes_no_ind 			AS transaction_admitted_yes_no_ind 
						,x.old_transaction_percentage 			AS transaction_percentage 
						,x.old_transaction_basis 			AS transaction_basis 
						,x.old_transaction_rounding 			AS transaction_rounding 
						,x.old_transaction_taxable 			AS transaction_taxable 
						,x.old_transaction_indicator 			AS transaction_indicator 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_policies_acct_prefill_ati 	AS x 
	INNER JOIN 	sagitta.policies_acct_prefill_ati 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
