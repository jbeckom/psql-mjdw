CREATE TABLE sagitta.staff_addlinfo (
	 sagitem 						varchar(5) 	NOT NULL 
	,audit_staff_cd 				TEXT 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,only_staff_name 				TEXT 		NULL 
	,associate_role 				TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT staff_addlinfo_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.staff_addlinfo OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.staff_addlinfo TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.staff_addlinfo TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.staff_addlinfo TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.staff_addlinfo FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_addlinfo_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.staff_addlinfo FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_staff_addlinfo_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.staff_addlinfo FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_staff_addlinfo_u();
GO 
