CREATE TABLE benefitpoint.audit_agency_info (
	 account_id 						int 				NOT NULL 
	,old_email 							varchar(100) 		NULL 
	,new_email 							varchar(100) 		NULL 
	,old_taxpayer_id 					varchar(9) 			NULL 
	,new_taxpayer_id 					varchar(9) 			NULL 
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
ALTER TABLE benefitpoint.audit_agency_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_agency_info TO rl_benefitpoint_a;
GO 
