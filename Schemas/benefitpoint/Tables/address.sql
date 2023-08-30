CREATE TABLE IF NOT EXISTS benefitpoint.address (
	 address_source 	TEXT 			NOT NULL 
	,source_type 		TEXT 			NOT NULL 
	,source_key 		int 			NOT NULL 
	,street_1 			varchar(100) 	NULL 
	,street_2 			varchar(100) 	NULL  
	,city 				varchar(100) 	NULL 
	,state 				text 			NULL 
	,zip 				varchar(100) 	NULL 
	,country 			text 			NULL 
	,CONSTRAINT address_pkey PRIMARY KEY (address_source, source_type, source_key)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.address OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.address TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.address TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.address TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.address FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_address_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.address FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_address_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.address FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_address_u();
GO 
