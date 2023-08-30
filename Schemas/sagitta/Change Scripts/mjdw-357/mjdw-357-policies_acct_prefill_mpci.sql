/*** DROP EXISTING CONSTRAINT(S), ADD UNIQUE CONSTRAINT ON SOURCE IDENTIFIER, CREATE NEW/CONSISTENT ID FIELD AS PRIMARY KEY ***/
ALTER TABLE sagitta.policies_acct_prefill_mpci 
	 DROP CONSTRAINT IF EXISTS policies_acct_prefill_mpci_pkey 
	,ADD CONSTRAINT policies_acct_prefill_mpci_sagitem_uq 	UNIQUE (sagitem)
	,ADD COLUMN id 			BIGINT 			NOT NULL 			GENERATED ALWAYS AS IDENTITY 			PRIMARY KEY; 
GO

/*** REMOVE LEGACY TRIGGER(S) ***/
DROP TRIGGER IF EXISTS audit_d ON sagitta.policies_acct_prefill_mpci; 
GO
DROP TRIGGER IF EXISTS audit_i ON sagitta.policies_acct_prefill_mpci; 
GO
DROP TRIGGER IF EXISTS audit_u ON sagitta.policies_acct_prefill_mpci; 
GO

/*** DROP AND RE-CREATE CONSISTENT LOG CHANGE TRIGGER  ***/
DROP TRIGGER IF EXISTS log_change_iud ON sagitta.policies_acct_prefill_mpci; 
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.policies_acct_prefill_mpci FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change(); 
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
		,'policies_acct_prefill_mpci' 			AS table_name 
		,y.id 			AS table_key 
		,( 
			SELECT 	row_to_json(_) 
			FROM ( 
				SELECT 	 x.sagitem
						,x.lis
						,x.old_producer_cd 			AS producer_cd 
						,x.old_producer_new_pct 			AS producer_new_pct 
						,x.old_ig_rel_ind 			AS ig_rel_ind 
						,x.old_producer_renewal_pct 			AS producer_renewal_pct 
			) 	AS _ 
		) 			AS new_record 
FROM sagitta.audit_policies_acct_prefill_mpci 	AS x 
	INNER JOIN 	sagitta.policies_acct_prefill_mpci 	AS y 
		ON x.sagitem = y.sagitem
			 AND x.lis = y.lis; 
GO 
