DROP TABLE IF EXISTS sagitta.policies_acct_prefill_ati;
GO 

CREATE TABLE sagitta.policies_acct_prefill_ati (
	 sagitem 							int 		NOT NULL
	,lis 								int 		NOT NULL 
	,transaction_cd 					TEXT 		NULL 
	,transaction_cov_cd 				TEXT 		NULL 
	,transaction_payee_cd 				TEXT 		NULL 
	,transaction_amt 					TEXT 		NULL 
	,transaction_prorated_repeated 		TEXT 		NULL 
	,transaction_admitted_yes_no_ind 	TEXT 		NULL 
	,transaction_percentage 			TEXT 		NULL 
	,transaction_basis 					TEXT 		NULL 
	,transaction_rounding 				TEXT 		NULL 
	,transaction_taxable 				TEXT 		NULL 
	,transaction_indicator 				TEXT 		NULL 
	,CONSTRAINT policies_acct_prefill_ati_pkey PRIMARY KEY (sagitem, lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.policies_acct_prefill_ati OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.policies_acct_prefill_ati TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.policies_acct_prefill_ati TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.policies_acct_prefill_ati TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.policies_acct_prefill_ati FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.policies_acct_prefill_ati FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.policies_acct_prefill_ati FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_ati_u();
GO 
