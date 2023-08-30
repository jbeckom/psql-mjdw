CREATE TABLE powerapps.account_tags(
	 account_guid 		uuid 		NOT NULL 
	,tag_guid 	uuid 		NOT NULL 
	,modify_dt 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,guid 				uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4()
	,is_dirty 			bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT account_tags_pkey PRIMARY KEY (guid)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_tags OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE powerapps.account_tags TO rl_powerapps_r;
GO

GRANT INSERT ON TABLE powerapps.account_tags TO rl_powerapps_a;
GO 

GRANT UPDATE ON TABLE powerapps.account_tags TO rl_powerapps_w;
GO 