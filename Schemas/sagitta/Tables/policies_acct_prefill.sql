DROP TABLE IF EXISTS sagitta.policies_acct_prefill;
GO 

CREATE TABLE sagitta.policies_acct_prefill (
	 sagitem 						int 		NOT NULL 
	,audit_staff_cd 				TEXT 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,audit_effective_dt 			TEXT 		NULL 
	,audit_change_agency_id 		TEXT 		NULL 
	,policy_number 					TEXT 		NULL 
	,client_cd 						TEXT 		NULL 
	,net_commission_pct 			TEXT 		NULL 
	,create_producer_payable 		TEXT 		NULL 
	,filing_state 					TEXT 		NULL 
	,CONSTRAINT policies_acct_prefill_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.policies_acct_prefill OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.policies_acct_prefill TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.policies_acct_prefill TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.policies_acct_prefill TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.policies_acct_prefill FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.policies_acct_prefill FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.policies_acct_prefill FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_policies_acct_prefill_u();
GO 
