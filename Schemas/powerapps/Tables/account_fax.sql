CREATE TABLE IF NOT EXISTS powerapps.account_fax (
	 account_guid 	uuid 		NOT NULL 
	,fax_guid 		uuid 		NOT NULL 
	,fax_type 		TEXT 		NULL 
	,af_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,af_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT account_fax_type_uid UNIQUE (account_guid, fax_guid, fax_type)
	,CONSTRAINT account_fax_account_guid_fkey FOREIGN KEY (account_guid) REFERENCES powerapps.account (guid) ON DELETE CASCADE
	,CONSTRAINT account_fax_fax_guid_fkey FOREIGN KEY (fax_guid) REFERENCES powerapps.fax (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_fax OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.account_fax TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.account_fax TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.account_fax TO rl_powerapps_w;
GO