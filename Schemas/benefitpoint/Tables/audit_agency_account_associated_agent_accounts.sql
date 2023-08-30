CREATE TABLE benefitpoint.audit_agency_account_associated_agent_accounts (
	 agency_account_id 					int 		NOT NULL 
	,old_associated_agent_account_id 	int 		NULL 
	,new_associated_agent_account_id 	int 		NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_agency_account_associated_agent_accounts OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_agency_account_associated_agent_accounts TO rl_benefitpoint_a;
GO 
