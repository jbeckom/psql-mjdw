CREATE TABLE powerapps.account_social_media(
	 account_guid 					uuid 		NOT NULL 
	,social_media_guid 				uuid 		NOT NULL 
	,account_social_media_owner 	TEXT 		NULL 
	,status 						TEXT 		NULL 
	,status_reason 					TEXT 		NULL 
	,guid 							uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4()
	,modify_dt 						timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 						bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT account_fkey FOREIGN KEY (account_guid) REFERENCES powerapps.account (guid) ON DELETE CASCADE 
	,CONSTRAINT social_media_fkey FOREIGN KEY (social_media_guid) REFERENCES powerapps.social_media (guid) ON DELETE CASCADE 
	,CONSTRAINT account_social_media_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_social_media OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.account_social_media TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.account_social_media TO rl_powerapps_a;
GO 
GRANT UPDATE ON TABLE powerapps.account_social_media TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.account_social_media FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_account_social_media_d();
GO 
CREATE TRIGGER audit_i AFTER INSERT ON powerapps.account_social_media FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_account_social_media_i();
GO 
CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.account_social_media FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_account_social_media_u();
GO 
