CREATE TABLE sagitta.staff (
	 sagitem 						varchar(5) 	NOT NULL 
	,audit_staff_cd 				TEXT 		NULL
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,staff_name 					TEXT 		NULL 
	,addr_1 						TEXT 		NULL 
	,addr_2 						TEXT 		NULL 
	,postal_code 					TEXT 		NULL 
	,postal_extension_code 			TEXT 		NULL 
	,city 							TEXT 		NULL 
	,state_prov_cd 					TEXT 		NULL 
	,work_phone_number 				TEXT 		NULL 
	,home_phone_number 				TEXT 		NULL 
	,dept 							TEXT 		NULL 
	,hired_dt 						TEXT 		NULL 
	,next_review_dt 				TEXT 		NULL 
	,termination_dt 				TEXT 		NULL 
	,annual_salary_amt 				TEXT 		NULL 
	,division_id 					TEXT 		NULL 
	,tax_id 						TEXT 		NULL 
	,emergency_phone_number 		TEXT 		NULL 
	,title 							TEXT 		NULL 
	,birth_dt 						TEXT 		NULL 
	,skip_flag 						TEXT 		NULL 
	,display_only 					TEXT 		NULL 
	,date_off 						TEXT 		NULL 
	,date_off_remark 				TEXT 		NULL
	,fax_number 					TEXT 		NULL 
	,super_user_id 					TEXT 		NULL 
	,agency_cd 						TEXT 		NULL 
	,email_addr 					TEXT 		NULL 
	,"role" 						TEXT 		NULL 
	,national_producer_number 		TEXT 		NULL 
	,service_account 				TEXT 		NULL 
	,integration_staff_name 		TEXT 		NULL 
	,integration_staff_title 		TEXT 		NULL 
	,mobile_phone 					TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT staff_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.staff OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.staff TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.staff TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.staff TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.staff FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.staff FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.staff FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_staff_u();
GO 
