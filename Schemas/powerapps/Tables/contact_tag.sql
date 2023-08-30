CREATE TABLE powerapps.contact_tag(
	 contact_guid 		uuid 		NOT NULL 
	,tag_guid 	uuid 		NOT NULL 
	,modify_dt 			timestamp 	NOT NULL 	
	,guid 				uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4()
	,is_dirty 			bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT contacts_tag_pkey PRIMARY KEY (guid)
	,CONSTRAINT contact_tag_guid_uid UNIQUE (contact_guid, tag_guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact_tag OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE powerapps.contact_tag TO rl_powerapps_r;
GO 

GRANT INSERT ON TABLE powerapps.contact_tag TO rl_powerapps_a;
GO 

GRANT UPDATE ON TABLE powerapps.contact_tag TO rl_powerapps_w;
GO 