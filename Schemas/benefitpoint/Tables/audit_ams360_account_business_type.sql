CREATE TABLE IF NOT EXISTS benefitpoint.audit_ams360_account_business_type (
	 account_id 						int 	NOT NULL 
	,old_is_benefits 					bool 	NULL 
	,new_is_benefits 					bool 	NULL 
	,old_is_commercial 					bool 	NULL 
	,new_is_commercial 					bool 	NULL 
	,old_is_financial 					bool 	NULL 
	,new_is_financial 					bool 	NULL 
	,old_is_health 						bool 	NULL 
	,new_is_health 						bool 	NULL 
	,old_is_life 						bool 	NULL 
	,new_is_life 						bool 	NULL 
	,old_is_non_property_and_casualty 	bool 	NULL 
	,new_is_non_property_and_casualty 	bool 	NULL 
	,old_is_personal 					bool 	NULL 
	,new_is_personal 					bool 	NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_ams360_account_business_type OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_ams360_account_business_type TO rl_benefitpoint_a;
GO
