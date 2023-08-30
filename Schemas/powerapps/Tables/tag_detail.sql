CREATE TABLE powerapps.tag_detail (
	 tag_name 	TEXT 		NOT NULL 
	,tag_type 	TEXT 		NOT NULL 
	,tag_owner 	TEXT 		NULL 
	,status 	TEXT 		NULL 
	,modify_dt 	timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 
	,is_dirty 	bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT tag_detail_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.tag_detail OWNER TO mj_admin;
GO 
GRANT SELECT ON TABLE powerapps.tag_detail TO rl_powerapps_r;
GO 
GRANT INSERT ON TABLE powerapps.tag_detail TO rl_powerapps_a;
GO 
GRANT UPDATE ON TABLE powerapps.tag_detail TO rl_powerapps_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON powerapps.tag_detail FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_tag_detail_d();
GO 
CREATE TRIGGER audit_i AFTER INSERT ON powerapps.tag_detail FOR EACH ROW EXECUTE FUNCTION powerapps.tr_audit_tag_detail_i();
GO 
CREATE TRIGGER audit_u AFTER UPDATE ON powerapps.tag_detail FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION powerapps.tr_audit_tag_detail_u();
GO 
