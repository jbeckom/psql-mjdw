CREATE TABLE sagitta.contacts_phone_group (
	 sagitem 			int 		NOT NULL 
	,lis 				int 		NOT NULL 
	,"type" 			TEXT 		NULL 
	,phone_number 		TEXT 		NULL 
	,"extension" 		TEXT 		NULL 
	,primary_phone 		TEXT 		NULL 
	,mobile_number 		TEXT 		NULL 
	,primary_mobile 	TEXT 		NULL 
	,fax 				TEXT 		NULL 
	,preferred 			TEXT 		NULL 
	,modify_dt 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::text, clock_timestamp())
	,CONSTRAINT contacts_phone_group_pkey PRIMARY KEY (sagitem, lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.contacts_phone_group OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.contacts_phone_group TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.contacts_phone_group TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.contacts_phone_group TO rl_sagitta_w;
GO 

GRANT DELETE ON TABLE sagitta.contacts_phone_group TO rl_sagitta_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.contacts_phone_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_phone_group_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.contacts_phone_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_phone_group_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.contacts_phone_group FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_contacts_phone_group_u();
GO 
