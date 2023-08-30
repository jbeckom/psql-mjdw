DROP TABLE IF EXISTS sagitta.policies_acct_prefill_mbpati;
GO 

CREATE TABLE sagitta.policies_acct_prefill_mbpati (
	 sagitem 			int 		NOT NULL 
	,lis 				int 		NOT NULL
	,billto 			TEXT 		NULL 
	,billto_percent 	TEXT 		NULL 
	,billto_amount 		TEXT 		NULL 
	,ins 				TEXT 		NULL 
	,payee 				TEXT 		NULL 
	,payee_percent 		TEXT 		NULL 
	,payee_amt 			TEXT 		NULL 
	,agency_pct 		TEXT 		NULL 
	,agency_amt 		TEXT 		NULL  
	,CONSTRAINT policies_acct_prefill_mbpati_pkey PRIMARY KEY (sagitem, lis) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.policies_acct_prefill_mbpati OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.policies_acct_prefill_mbpati TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.policies_acct_prefill_mbpati TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.policies_acct_prefill_mbpati TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.policies_acct_prefill_mbpati FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.policies_acct_prefill_mbpati FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.policies_acct_prefill_mbpati FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_mbpati_u();
GO 