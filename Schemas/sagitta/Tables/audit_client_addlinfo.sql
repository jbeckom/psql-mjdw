CREATE TABLE sagitta.audit_clients_addlinfo (
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
	,old_serv_4 						TEXT 		NULL 
	,new_serv_4 						TEXT 		NULL 
	,old_serv_5 						TEXT 		NULL 
	,new_serv_5 						TEXT 		NULL 
	,old_client_exec 					TEXT 		NULL 
	,new_client_exec 					TEXT 		NULL 
	,old_prod_4 						TEXT 		NULL 
	,new_prod_4 						TEXT 		NULL 
	,old_prod_5 						TEXT 		NULL 
	,new_prod_5 						TEXT 		NULL 
	,old_budgeted_revenue 				TEXT 		NULL 
	,new_budgeted_revenue 				TEXT 		NULL 
	,old_invoice_contact 				TEXT 		NULL 
	,new_invoice_contact 				TEXT 		NULL 
	,old_rewrite 						TEXT 		NULL 
	,new_rewrite 						TEXT 		NULL 
	,old_invoice_email_address 			TEXT 		NULL 
	,new_invoice_email_address 			TEXT 		NULL 
	,old_invoice_fax_number 			TEXT 		NULL 
	,new_invoice_fax_number 			TEXT 		NULL 
	,old_industry_segment 				TEXT 		NULL 
	,new_industry_segment 				TEXT 		NULL 
	,old_mc_number 						TEXT 		NULL 
	,new_mc_number 						TEXT 		NULL 
	,old_dot_number 					TEXT 		NULL 
	,new_dot_number 					TEXT 		NULL 
	,audit_action 						char(1) 	NOT NULL 
	,audit_user 						TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 					timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 							bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_clients_addlinfo OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_clients_addlinfo TO rl_sagitta_a;
GO 
