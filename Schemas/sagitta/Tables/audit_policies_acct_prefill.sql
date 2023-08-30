CREATE TABLE sagitta.audit_policies_acct_prefill (
	 sagitem 							int 		NOT NULL
	,old_audit_staff_cd                 TEXT    	NULL 
	,new_audit_staff_cd                 TEXT    	NULL 
	,old_audit_entry_dt                 int 		NULL 
	,new_audit_entry_dt                 int 		NULL 
	,old_audit_time                     int 		NULL 
	,new_audit_time                     int 		NULL 
	,old_audit_cd                       TEXT    	NULL 
	,new_audit_cd                       TEXT    	NULL 
	,old_audit_history_record_number    TEXT    	NULL 
	,new_audit_history_record_number    TEXT    	NULL 
	,old_audit_program                  TEXT    	NULL 
	,new_audit_program                  TEXT    	NULL 
	,old_audit_effective_dt             TEXT    	NULL 
	,new_audit_effective_dt             TEXT    	NULL 
	,old_audit_change_agency_id         TEXT    	NULL 
	,new_audit_change_agency_id         TEXT    	NULL 
	,old_policy_number                  TEXT    	NULL 
	,new_policy_number                  TEXT    	NULL 
	,old_client_cd                      TEXT    	NULL 
	,new_client_cd                      TEXT    	NULL 
	,old_net_commission_pct             TEXT    	NULL 
	,new_net_commission_pct             TEXT    	NULL 
	,old_create_producer_payable        TEXT    	NULL 
	,new_create_producer_payable        TEXT    	NULL 
	,old_filing_state                   TEXT    	NULL 
	,new_filing_state                   TEXT    	NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_policies_acct_prefill OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_policies_acct_prefill TO rl_sagitta_a;
GO 