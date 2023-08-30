CREATE TABLE IF NOT EXISTS benefitpoint.audit_individual_account_info (
	 account_id 						int 		NOT NULL 
	,old_email 							varchar(250) 	NULL 
	,new_email 							varchar(250) 	NULL 
	,old_affiliated_group_account_id 	int 			NULL 
	,new_affiliated_group_account_id 	int 			NULL 
	,audit_action 						char(1) 		NOT NULL 
	,audit_user 						TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_individual_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_individual_account_info TO rl_benefitpoint_a;
GO 
