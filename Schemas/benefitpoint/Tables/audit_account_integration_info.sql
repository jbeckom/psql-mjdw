CREATE TABLE IF NOT EXISTS benefitpoint.audit_account_integration_info (
	 account_id 						int 			NOT NULL 
	,sagitta_client_id 					varchar(100) 	NOT NULL 
	,old_source_code 					varchar(16) 	NULL 
	,new_source_code 					varchar(16) 	NULL 
	,old_primary_sales_lead_int_code 	varchar(10) 	NULL 
	,new_primary_sales_lead_int_code 	varchar(10) 	NULL 
	,old_primary_service_lead_int_code 	varchar(10) 	NULL 
	,new_primary_service_lead_int_code 	varchar(10) 	NULL 
	,old_ams_customer_id 				TEXT 			NULL 
	,new_ams_customer_id 				TEXT 			NULL 
	,old_ams_customer_number 			int 			NULL 
	,new_ams_customer_number 			int 			NULL 
	,audit_action 						char(1) 		NOT NULL 
	,audit_user 						TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account_integration_info OWNER TO mj_admin;
GO 

GRANT INSERT ON benefitpoint.audit_account_integration_info TO rl_benefitpoint_a;
GO 
