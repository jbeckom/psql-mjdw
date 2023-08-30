CREATE TABLE powerapps.social_media (
	 social_media_source 	TEXT 			NOT NULL 
	,source_key 			TEXT 			NOT NULL 
	,social_media_type 		TEXT 			NULL 
	,url 					varchar(8000) 	NULL 
	,modify_dt 				timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 				bool 			NOT NULL 	DEFAULT TRUE 
	,guid 					uuid 			NOT NULL 	DEFAULT public.uuid_generate_v4()
	,CONSTRAINT source_key_uid UNIQUE (social_media_source, source_key)
	,CONSTRAINT social_media_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.social_media OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.social_media TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.social_media TO rl_powerapps_a;
GO 
GRANT UPDATE ON TABLE powerapps.social_media TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.social_media FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_social_media_d();
GO 
CREATE TRIGGER audit_i AFTER INSERT ON powerapps.social_media FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_social_media_i();
GO 
CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.social_media FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_social_media_u();
GO 
