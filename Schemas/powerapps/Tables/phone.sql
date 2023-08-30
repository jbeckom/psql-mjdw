DROP TABLE IF EXISTS powerapps.phone;
GO 

CREATE TABLE powerapps.phone (
	 phone_source 		TEXT 			NOT NULL 
	,source_type 		TEXT 			NOT NULL 
	,source_key 		TEXT 			NOT NULL 
	,source_phone_type 	TEXT 			NOT NULL 
	,phone_type 		TEXT 			NULL 
	,phone 				varchar(200) 	NULL 
	,phone_owner 		TEXT 			NULL 
	,status 			TEXT 			NULL 
	,status_reason 		TEXT 			NULL 
	,guid 				uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 			bool 			NOT NULL 	DEFAULT TRUE
	,CONSTRAINT phone_pkey PRIMARY KEY (guid)
	,CONSTRAINT phone_source_key_type_uid UNIQUE (phone_source, source_type, source_key, source_phone_type, phone)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.phone OWNER TO mj_admin;
GO

GRANT INSERT ON TABLE powerapps.phone TO rl_powerapps_a;
GO

GRANT SELECT ON TABLE powerapps.phone TO rl_powerapps_r;
GO

GRANT UPDATE ON TABLE powerapps.phone TO rl_powerapps_w;
GO


/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.phone FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_phone_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.phone FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_phone_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.phone FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_phone_u();
GO