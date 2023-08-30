DROP TABLE IF EXISTS powerapps.address;
GO 

CREATE TABLE powerapps.address (
	 address_source 		TEXT 			NOT NULL 
	,source_type 			TEXT 			NOT NULL 
	,source_key 			TEXT 			NOT NULL 
	,source_address_type 	TEXT 			NOT NULL 
	,address_type 			text 			NULL 
	,street_1 				varchar(200) 	NULL
	,street_2 				varchar(200) 	NULL 
	,city 					varchar(200) 	NULL 
	,state_province 		varchar(200) 	NULL 
	,zip_post_code 			varchar(15) 	NULL 
	,country_region 		varchar(100) 	NULL 
	,address_owner 			varchar(100) 	NULL 
	,status_cd 				varchar(1000) 	NULL 
	,status_reason 			varchar(205) 	NULL 
	,guid 					uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 				timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 				bool 			NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT address_pkey PRIMARY KEY (guid)
	,CONSTRAINT address_source_type_key_uid UNIQUE (address_source, source_type, source_key, source_address_type)
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.address OWNER TO mj_admin;
GO

GRANT INSERT ON TABLE powerapps.address TO rl_powerapps_a;
GO

GRANT SELECT ON TABLE powerapps.address TO rl_powerapps_r;
GO

GRANT UPDATE ON TABLE powerapps.address TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.address FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_address_d();
GO

CREATE TRIGGER audit_i AFTER INSERT ON powerapps.address FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_address_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.address FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_address_u();
GO