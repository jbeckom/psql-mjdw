CREATE TABLE sagitta.contacts (
	 sagitem 						int 		NOT NULL 
	,audit_staff_cd 				TEXT 		NULL 
	,audit_entry_dt 				int 		NULL 
	,audit_time 					int 		NULL 
	,audit_cd 						TEXT 		NULL 
	,audit_history_record_number 	TEXT 		NULL 
	,audit_program 					TEXT 		NULL 
	,client_id 						int 		NULL 
	,contact_type_cd 				TEXT 		NULL 
	,given_name 					TEXT 		NULL 
	,other_given_name 				TEXT 		NULL 
	,surname 						TEXT 		NULL 
	,suffix 						TEXT 		NULL 
	,salutation 					TEXT 		NULL 
	,birth_dt 						int 		NULL 
	,spouse 						TEXT 		NULL 
	,profession 					TEXT 		NULL 
	,title 							TEXT 		NULL 
	,company 						TEXT 		NULL 
	,sex_cd 						TEXT 		NULL 
	,office_location 				TEXT 		NULL 
	,"comments" 					TEXT 		NULL 
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::text, clock_timestamp())
	,CONSTRAINT contacts_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.contacts OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.contacts TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.contacts TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.contacts TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.contacts FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.contacts FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.contacts FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_contacts_u();
GO 