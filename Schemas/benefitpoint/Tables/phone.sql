CREATE TABLE benefitpoint.phone (
	 phone_source 	TEXT 	NOT NULL 
	,source_type 	TEXT 	NOT NULL 
	,source_key 	int 	NOT NULL 
	,area_code 		TEXT 	NULL 
	,phone_number 	TEXT 	NOT NULL 
	,phone_type 	benefitpoint.phone_type 	NOT NULL 
	,CONSTRAINT phone_pkey PRIMARY KEY (phone_source, source_type, source_key)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.phone OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.phone TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.phone TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.phone TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.phone FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_phone_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.phone FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_phone_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.phone FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_phone_u();
GO 
