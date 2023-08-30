CREATE TABLE sagitta.credit_terms (
	 sagitem 						varchar(3) 	NOT NULL 
	,audit_staff_cd 				TEXT 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						text 		NULL 
	,audit_history_record_number 	text 		NULL 
	,audit_program 					text 		NULL 
	,credit_terms_description 		text 		NULL 
	,due_days 						TEXT 		NULL 
	,"percent" 						TEXT 		NULL 
	,date_off 						TEXT 		NULL 
	,date_off_remarks 				TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::text, clock_timestamp())
	,CONSTRAINT credit_terms_pkey PRIMARY KEY (sagitem) 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.credit_terms OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.credit_terms TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.credit_terms TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.credit_terms TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.credit_terms FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_credit_terms_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.credit_terms FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_credit_terms_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.credit_terms FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_credit_terms_u();
GO 