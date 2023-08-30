CREATE TABLE IF NOT EXISTS benefitpoint.audit_dependent (
	 account_id 		int 			NOT NULL 
	,dependent_id 		int 			NOT NULL 
	,old_relationship 	varchar(100) 	NULL 
	,new_relationship 	varchar(100) 	NULL 
	,audit_action 		char(1) 		NOT NULL 
	,audit_user 		TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 	timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_dependent OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_dependent TO rl_benefitpoint_a;
GO 
