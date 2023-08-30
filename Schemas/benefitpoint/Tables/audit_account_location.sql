CREATE TABLE IF NOT EXISTS benefitpoint.audit_account_location (
	 account_id 		int 			NOT NULL 
	,location_id 		int 			NOT NULL 
	,old_code 			TEXT 			NULL 
	,new_code 			TEXT 			NULL 
	,old_name 			TEXT 			NULL 
	,new_name 			TEXT 			NULL 
	,old_payroll_cycle 	TEXT 			NULL 
	,new_payroll_cycle 	TEXT 			NULL 
	,audit_action 		char(1) 		NOT NULL 
	,audit_user 		TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 	timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,audit_id 			bigint 			NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account_location OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account_location TO rl_benefitpoint_a;
GO 
