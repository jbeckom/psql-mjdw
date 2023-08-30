DROP TABLE IF EXISTS sagitta.policies_acct_prefill_mpci;
GO 

CREATE TABLE sagitta.policies_acct_prefill_mpci (
	 sagitem 				int 		NOT NULL 
	,lis 					int 		NOT NULL 
	,producer_cd 			TEXT 		NULL 
	,producer_new_pct 		TEXT 		NULL 
	,ig_rel_ind 			TEXT 		NULL 
	,producer_renewal_pct 	TEXT 		NULL  
	,CONSTRAINT policies_acct_prefill_mpci_pkey PRIMARY KEY (sagitem, lis) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.policies_acct_prefill_mpci OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.policies_acct_prefill_mpci TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.policies_acct_prefill_mpci TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.policies_acct_prefill_mpci TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.policies_acct_prefill_mpci FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.policies_acct_prefill_mpci FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.policies_acct_prefill_mpci FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mpci_u();
GO 
