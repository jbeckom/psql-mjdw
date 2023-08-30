CREATE TABLE IF NOT EXISTS powerapps.account_address(
	 account_guid 	uuid 		NOT NULL 
	,address_guid 	uuid 		NOT NULL 
	,address_type 	TEXT 		NULL 
	,aa_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,aa_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE
	,CONSTRAINT account_address_type_uid UNIQUE (account_guid, address_guid, address_type)
	,CONSTRAINT account_address_account_guid_fkey FOREIGN KEY (account_guid) REFERENCES powerapps.account (guid) ON DELETE CASCADE 
	,CONSTRAINT account_address_address_guid_fkey FOREIGN KEY (address_guid) REFERENCES powerapps.address (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_address OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.account_address TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.account_address TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.account_address TO rl_powerapps_w;
GO