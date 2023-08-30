CREATE TABLE sagitta.audit_contacts (
 	 sagitem 							int 		NOT NULL 
	,old_audit_staff_cd 				TEXT 		NULL 
	,new_audit_staff_cd 				TEXT 		NULL 
	,old_audit_entry_dt 				TEXT 		NULL 
	,new_audit_entry_dt 				TEXT 		NULL 
	,old_audit_time 					TEXT 		NULL 
	,new_audit_time 					TEXT 		NULL 
	,old_audit_cd 						TEXT 		NULL 
	,new_audit_cd 						TEXT 		NULL 
	,old_audit_history_record_number 	TEXT 		NULL 
	,new_audit_history_record_number 	TEXT 		NULL 
	,old_audit_program 					TEXT 		NULL 
	,new_audit_program 					TEXT 		NULL 
	,old_client_id 						TEXT 		NULL 
	,new_client_id 						TEXT 		NULL 
	,old_contact_type_cd 				TEXT 		NULL 
	,new_contact_type_cd 				TEXT 		NULL 
	,old_given_name 					TEXT 		NULL 
	,new_given_name 					TEXT 		NULL 
	,old_other_given_name 				TEXT 		NULL 
	,new_other_given_name 				TEXT 		NULL 
	,old_surname 						TEXT 		NULL 
	,new_surname 						TEXT 		NULL 
	,old_suffix 						TEXT 		NULL 
	,new_suffix 						TEXT 		NULL 
	,old_salutation 					TEXT 		NULL 
	,new_salutation 					TEXT 		NULL 
	,old_birth_dt 						TEXT 		NULL 
	,new_birth_dt 						TEXT 		NULL 
	,old_spouse 						TEXT 		NULL 
	,new_spouse 						TEXT 		NULL 
	,old_profession 					TEXT 		NULL 
	,new_profession 					TEXT 		NULL 
	,old_title 							TEXT 		NULL 
	,new_title 							TEXT 		NULL 
	,old_company 						TEXT 		NULL 
	,new_company 						TEXT 		NULL 
	,old_sex_cd 						TEXT 		NULL 
	,new_sex_cd 						TEXT 		NULL 
	,old_office_location 				TEXT 		NULL 
	,new_office_location 				TEXT 		NULL 
	,old_comments 						TEXT 		NULL 
	,new_comments 						TEXT 		NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_contacts OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_contacts TO rl_sagitta_a;
GO 
