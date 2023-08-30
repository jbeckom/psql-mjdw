CREATE TABLE IF NOT EXISTS benefitpoint.license (
	 license_source			text 					not null 
	,source_key  			int 					NOT NULL 
	,license_id 			int 					NOT NULL 
	,state 					text 					NULL 
	,license_number 		text 					NULL 
	,residence_license 		bool 					NULL 
	,license_on 			timestamp 				NULL 
	,license_expires_on 	timestamp 				NULL 
	,e_and_o_expires_on 	timestamp 				NULL 
	,CONSTRAINT license_pkey PRIMARY KEY (license_source, source_key, license_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.license OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.license TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.license TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.license TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.license FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_license_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.license FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_license_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.license FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_license_u();
GO 
