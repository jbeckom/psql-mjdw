CREATE TABLE sagitta.audit_policies_acct_prefill_ati (
	 sagitem 								int 		NOT NULL 
	,lis 									int 		NOT NULL 
	,old_transaction_cd                     TEXT    	NULL
	,new_transaction_cd                     TEXT    	NULL
	,old_transaction_cov_cd                 TEXT    	NULL
	,new_transaction_cov_cd                 TEXT    	NULL
	,old_transaction_payee_cd               TEXT    	NULL
	,new_transaction_payee_cd               TEXT    	NULL
	,old_transaction_amt                    TEXT    	NULL
	,new_transaction_amt                    TEXT    	NULL
	,old_transaction_prorated_repeated      TEXT    	NULL
	,new_transaction_prorated_repeated      TEXT    	NULL
	,old_transaction_admitted_yes_no_ind    TEXT    	NULL
	,new_transaction_admitted_yes_no_ind    TEXT    	NULL
	,old_transaction_percentage             TEXT    	NULL
	,new_transaction_percentage             TEXT    	NULL
	,old_transaction_basis                  TEXT    	NULL
	,new_transaction_basis                  TEXT    	NULL
	,old_transaction_rounding               TEXT    	NULL
	,new_transaction_rounding               TEXT    	NULL
	,old_transaction_taxable                TEXT    	NULL
	,new_transaction_taxable                TEXT    	NULL
	,old_transaction_indicator              TEXT    	NULL
	,new_transaction_indicator              TEXT    	NULL
	,audit_action 							char(1) 	NOT NULL 
	,audit_user 							TEXT 		NOT NULL 	DEFAULT current_user
	,audit_timestmap 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 								bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_policies_acct_prefill_ati OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_policies_acct_prefill_ati TO rl_sagitta_a;
GO 
