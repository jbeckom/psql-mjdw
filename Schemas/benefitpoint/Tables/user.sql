CREATE TABLE benefitpoint."user" (
	 user_id 			int 			NOT NULL 
	,username 			TEXT 			NOT NULL 
	,first_name 		TEXT 			NOT NULL 
	,last_name 			TEXT 			NOT NULL 
	,title 				TEXT 			NULL 
	,office_id 			int 			NOT NULL 
	,last_modified_on 	timestamptz 	NULL 
	,last_login_on 		timestamptz 	NULL 
	,last_lockout_on 	timestamptz 	NULL 
	,roles 				TEXT 			NULL 
	,created_on 		timestamptz 	NULL 
	,notes 				TEXT 			NULL 
	,CONSTRAINT user_pkey PRIMARY KEY (user_id)
);

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint."user" OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint."user" TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint."user" TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint."user" TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint."user" FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_user_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint."user" FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_user_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint."user" FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_user_u();
GO 