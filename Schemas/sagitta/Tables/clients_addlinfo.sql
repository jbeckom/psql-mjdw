CREATE TABLE sagitta.clients_addlinfo (
	 sagitem 						int 		NOT NULL 
	,audit_staff_cd 				text 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,serv_4 						TEXT 		NULL 
	,serv_5 						TEXT 		NULL 
	,client_exec 					TEXT 		NULL 
	,prod_4 						TEXT 		NULL 
	,prod_5 						TEXT 		NULL 
	,budgeted_revenue 				TEXT 		NULL 
	,invoice_contact 				TEXT 		NULL 
	,rewrite 						TEXT 		NULL 
	,invoice_email_address 			TEXT 		NULL 
	,invoice_fax_number 			TEXT 		NULL 
	,industry_segment 				TEXT 		NULL 
	,mc_number 						TEXT 		NULL 
	,dot_number 					TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT clients_addlinfo_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.clients_addlinfo OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.clients_addlinfo TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.clients_addlinfo TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.clients_addlinfo TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.clients_addlinfo FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_clients_addlinfo_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.clients_addlinfo FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_clients_addlinfo_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.clients_addlinfo FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_clients_addlinfo_u();
GO 
