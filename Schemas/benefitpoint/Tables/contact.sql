CREATE TABLE benefitpoint.contact (
	 contact_source 	TEXT 	NOT NULL 
	,source_key 		int 	NOT NULL 
	,contact_id 		int 	NOT NULL 
	,first_name 		TEXT 	NOT NULL 
	,last_name 			TEXT 	NOT NULL 
	,email 				TEXT 	NULL 
	,CONSTRAINT contact_pkey PRIMARY KEY (contact_source, source_key, contact_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.contact OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.contact TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.contact TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.contact TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_contact_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.contact FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_contact_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.contact FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_contact_u();
GO 