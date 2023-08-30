CREATE TABLE IF NOT EXISTS benefitpoint.audit_brokerage_account_info (
	 account_id 					int 							NOT NULL 
	,account_type 					TEXT 							NOT NULL 
	,old_account_number 			varchar(100) 					NULL 
	,new_account_number 			varchar(100) 					NULL 
	,old_broker_of_record_as_of 	timestamp 						NULL 
	,new_broker_of_record_as_of 	timestamp 						NULL 
	,old_hipaa_required 			benefitpoint.optional_boolean 	NULL 
	,new_hipaa_required 			benefitpoint.optional_boolean 	NULL 
	,old_hipaa_signed_on 			timestamp 						NULL 
	,new_hipaa_signed_on 			timestamp 						NULL 
	,audit_action 					char(1) 						NOT NULL 
	,audit_user 					TEXT 							NOT NULL 	DEFAULT current_user 
	,audit_timestamp 				timestamp 						NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 						bigint 							NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_brokerage_account_info OWNER TO mj_admin;
GO 

GRANT INSERT ON benefitpoint.audit_brokerage_account_info TO rl_benefitpoint_a;
GO 
