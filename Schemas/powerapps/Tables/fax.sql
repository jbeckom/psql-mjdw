DROP TABLE IF EXISTS powerapps.fax;
GO 

CREATE TABLE IF NOT EXISTS powerapps.fax (
	 fax_source 		TEXT 			NOT NULL 
	,source_type 		TEXT 			NOT NULL 
	,source_key 		TEXT 			NOT NULL 
	,source_fax_type 	TEXT 			NOT NULL 
	,fax_type 			text 			NULL 
	,fax 				varchar(200) 	NULL 
	,fax_owner 			TEXT 			NULL 
	,status 			TEXT 			NULL 
	,status_reason 		TEXT 			NULL 
	,guid 				uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 			bool 			NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT fax_pkey PRIMARY KEY (guid)
	,CONSTRAINT fax_guid_uid UNIQUE (fax_source, source_type, source_key, source_fax_type)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.fax OWNER TO mj_admin;
GO

GRANT INSERT ON TABLE powerapps.fax TO rl_powerapps_a;
GO

GRANT SELECT ON TABLE powerapps.fax TO rl_powerapps_r;
GO

GRANT UPDATE ON TABLE powerapps.fax TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.fax FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_fax_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.fax FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_fax_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.fax FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_fax_u();
GO