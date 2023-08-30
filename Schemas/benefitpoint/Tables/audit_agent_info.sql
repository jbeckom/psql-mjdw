CREATE TABLE IF NOT EXISTS benefitpoint.audit_agent_info (
	 account_id 						int 				NOT NULL 
	,old_email 							varchar(100) 		NULL 
	,new_email 							varchar(100) 		NULL 
	,old_tax_payer_id 					text 				NULL 
	,new_tax_payer_id 					text 				NULL 
	,old_budgeted_total_annual_premium 	double PRECISION 	NULL 
	,new_budgeted_total_annual_premium 	double PRECISION 	NULL 
	,old_budgeted_total_annual_revenue 	double PRECISION 	NULL 
	,new_budgeted_total_annual_revenue 	double PRECISION 	NULL  
	,audit_action 						char(1) 			NOT NULL 
	,audit_user 						TEXT 				NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 			NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 				NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_agent_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_agent_info TO rl_benefitpoint_a;
GO 
