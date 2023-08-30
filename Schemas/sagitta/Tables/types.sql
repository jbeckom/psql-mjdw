CREATE TABLE IF NOT EXISTS sagitta."types" (
	 sagitem 						varchar(3) 		NOT NULL 
	,audit_staff_cd 				text 			NULL 
	,audit_entry_dt 				int 			NULL 
	,audit_time 					int 			NULL 
	,audit_cd 						TEXT 			NULL 
	,audit_history_record_number 	TEXT 			NULL 
	,audit_program 					TEXT 			NULL 
	,type_description 				TEXT 			NULL 
	,date_off 						TEXT 			NULL 
	,date_off_remarks 				TEXT 			NULL 
	,modify_dt 						timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT types_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta."types" OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta."types" TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta."types" TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta."types" TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER types_d AFTER DELETE ON sagitta."types" FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_types_d();
GO 

CREATE TRIGGER types_i AFTER INSERT ON sagitta."types" FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_types_i();
GO 

CREATE TRIGGER types_u AFTER UPDATE ON sagitta."types" FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_types_u();
GO 