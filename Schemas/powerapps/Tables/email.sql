DROP TABLE IF EXISTS powerapps.email;
GO 

CREATE TABLE powerapps.email(
	 email_source 		TEXT 			NOT NULL 
	,source_type 		TEXT 			NOT NULL 
	,source_key 		TEXT 			NOT NULL 
	,source_email_type 	TEXT 			NOT NULL 
	,email_type 		text 			NULL 
	,email 				varchar(200) 	NULL 
	,email_owner 		TEXT 			NULL 
	,status 			TEXT 			NULL 
	,status_reason 		TEXT 			NULL 
	,guid 				uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 			bool 			NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT email_pkey PRIMARY KEY (guid)
	,CONSTRAINT email_source_type_key_uid UNIQUE (email_source, source_type, source_key, source_email_type)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.email OWNER TO mj_admin;
GO

GRANT INSERT ON TABLE powerapps.email TO rl_powerapps_a;
GO

GRANT SELECT ON TABLE powerapps.email TO rl_powerapps_r;
GO

GRANT UPDATE ON TABLE powerapps.email TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.email FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_email_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.email FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_email_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.email FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_email_u();
GO