CREATE TABLE sagitta.audit_policies_acct_prefill_mpci (
	 sagitem 					int 		NOT NULL 
	,lis 						int 		NOT NULL 
	,old_producer_cd            TEXT    	NULL 
	,new_producer_cd            TEXT    	NULL 
	,old_producer_new_pct       TEXT    	NULL 
	,new_producer_new_pct       TEXT    	NULL 
	,old_ig_rel_ind             TEXT    	NULL 
	,new_ig_rel_ind             TEXT    	NULL 
	,old_producer_renewal_pct   TEXT    	NULL 
	,new_producer_renewal_pct   TEXT    	NULL 
	,audit_action 				char(1) 	NOT NULL 
	,audit_user 				TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestamp 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_policies_acct_prefill_mpci OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_policies_acct_prefill_mpci TO rl_sagitta_a;
GO 
