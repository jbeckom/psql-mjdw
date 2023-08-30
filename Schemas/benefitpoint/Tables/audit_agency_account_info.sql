CREATE TABLE benefitpoint.audit_agency_account_info (
	 account_id 		int 			NOT NULL 
	,old_agency_name 	varchar(250) 	NULL 
	,new_agency_name 	varchar(250) 	NULL 
	,audit_action 		char(1) 		NOT NULL 
	,audit_user 		TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 	timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_agency_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_agency_account_info TO rl_benefitpoint_a;
GO 
