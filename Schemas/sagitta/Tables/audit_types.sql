CREATE TABLE sagitta.audit_types (
	 sagitem 							varchar(3) 	NOT NULL 
	,old_audit_staff_cd 				text 		NULL 
	,new_audit_staff_cd 				text 		NULL 
	,old_audit_entry_dt 				int 		NULL 
	,new_audit_entry_dt 				int 		NULL 
	,old_audit_time 					int 		NULL 
	,new_audit_time 					int 		NULL 
	,old_audit_cd 						text 		NULL 
	,new_audit_cd 						text 		NULL 
	,old_audit_history_record_number 	text 		NULL 
	,new_audit_history_record_number 	text 		NULL 
	,old_audit_program 					text 		NULL 
	,new_audit_program 					text 		NULL 
	,old_type_description 				text 		NULL 
	,new_type_description 				text 		NULL 
	,old_date_off 						text 		NULL 
	,new_date_off 						text 		NULL 
	,old_date_off_remarks 				text 		NULL 
	,new_date_off_remarks 				text 		NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						text 		NOT NULL 	DEFAULT CURRENT_USER
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()) 
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_types OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_types TO rl_sagitta_a;
GO 