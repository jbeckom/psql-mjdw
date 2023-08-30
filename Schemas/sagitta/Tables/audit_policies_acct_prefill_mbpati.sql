CREATE TABLE sagitta.audit_policies_acct_prefill_mbpati (
	 sagitem 				int 		NOT NULL 
	,lis 					int 		NOT NULL
	,old_billto 			TEXT 		NULL 
    ,new_billto 			TEXT 		NULL 
	,old_billto_percent 	TEXT 		NULL 
    ,new_billto_percent 	TEXT 		NULL 
	,old_billto_amount 		TEXT 		NULL 
    ,new_billto_amount 		TEXT 		NULL 
	,old_ins 				TEXT 		NULL 
    ,new_ins 				TEXT 		NULL 
	,old_payee 				TEXT 		NULL 
    ,new_payee 				TEXT 		NULL 
	,old_payee_percent 		TEXT 		NULL 
    ,new_payee_percent 		TEXT 		NULL 
	,old_payee_amt 			TEXT 		NULL 
    ,new_payee_amt 			TEXT 		NULL 
	,old_agency_pct 		TEXT 		NULL 
    ,new_agency_pct 		TEXT 		NULL 
	,old_agency_amt 		TEXT 		NULL 
    ,new_agency_amt 		TEXT 		NULL 
    ,audit_action 			char(1) 	NOT NULL 
    ,audit_user 			TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_policies_acct_prefill_mbpati OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_policies_acct_prefill_mbpati TO rl_sagitta_a;
GO 
