CREATE TABLE IF NOT EXISTS benefitpoint.audit_account (
	 account_id 		                int 		NOT NULL 
	,old_active 						bool 			NULL 
	,new_active 						bool 			NULL 
	,old_inactive_as_of 				timestamp 		NULL 
	,new_inactive_as_of 				timestamp 		NULL 
	,old_inactive_reason				TEXT 			NULL 
	,new_inactive_reason				TEXT 			NULL 
	,old_account_classification 		TEXT 			NULL 
	,new_account_classification 		TEXT 			NULL 
	,old_account_type 					TEXT 			NULL 
	,new_account_type 					TEXT 			NULL 
	,old_office_id 						int 			NULL 
	,new_office_id 						int 			NULL 
	,old_department_id 					int 			NULL 
	,new_department_id 					int 			NULL 
	,old_administrator_user_id 			int 			NULL 
	,new_administrator_user_id 			int 			NULL 
	,old_primary_contact_user_id 		int 			NULL 
	,new_primary_contact_user_id 		int 			NULL 
	,old_primary_sales_lead_user_id 	int 			NULL 
	,new_primary_sales_lead_user_id 	int 			NULL 
	,old_primary_service_lead_user_id 	int 			NULL 
	,new_primary_service_lead_user_id 	int 			NULL 
	,old_notes 							varchar(1000)   NULL 
	,new_notes 							varchar(1000) 	NULL 
	,old_last_reviewed_by_user_id 		int 			NULL 
	,new_last_reviewed_by_user_id 		int 			NULL 
	,old_last_reviewed_on 				timestamp 		NULL 
	,new_last_reviewed_on 				timestamp 		NULL 
	,old_created_on 					timestamp 		NULL 
	,new_created_on 					timestamp 		NULL 
	,old_last_modified_on 				timestamp 		NULL 
	,new_last_modified_on 				timestamp 		NULL 
	,old_excluded_purge 				bool 			NULL 
	,new_excluded_purge 				bool 			NULL 
	,audit_action 						char(1) 		NOT NULL 
	,audit_user 						TEXT 			NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account TO rl_benefitpoint_a;
GO 
