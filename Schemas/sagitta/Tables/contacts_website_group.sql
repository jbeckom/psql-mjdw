CREATE TABLE sagitta.contacts_website_group (
	sagitem 	int 		NOT NULL 
	,lis 		int 		NOT NULL 
	,"type" 	TEXT 		NULL 
	,website 	TEXT 		NULL 
	,"primary" 	TEXT 		NULL 
	,preferred 	TEXT 		NULL 
	,modify_dt 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,CONSTRAINT contacts_website_group_pkey PRIMARY KEY (sagitem, lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.contacts_website_group OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE sagitta.contacts_website_group TO rl_sagitta_r;
GO 

GRANT INSERT ON TABLE sagitta.contacts_website_group TO rl_sagitta_a;
GO 

GRANT UPDATE ON TABLE sagitta.contacts_website_group TO rl_sagitta_w;
GO 

GRANT DELETE ON TABLE sagitta.contacts_website_group TO rl_sagitta_d;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.contacts_website_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_website_group_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.contacts_website_group FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_contacts_website_group_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.contacts_website_group FOR EACH ROW WHEN (NEW IS DISTINCT FROM OLD) EXECUTE FUNCTION sagitta.tr_audit_contacts_website_group_u();
GO 
