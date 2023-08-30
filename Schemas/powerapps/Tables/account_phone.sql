CREATE TABLE IF NOT EXISTS powerapps.account_phone (
	 account_guid 	uuid 		NOT NULL 
	,phone_guid 	uuid 		NOT NULL 
	,phone_type 	TEXT 		NULL 
	,ap_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,ap_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT FALSE 
	,CONSTRAINT account_phone_type_uid UNIQUE (account_guid, phone_guid, phone_type)
	,CONSTRAINT account_phone_account_guid_fkey FOREIGN KEY (account_guid) REFERENCES powerapps.account (guid) ON DELETE CASCADE 
	,CONSTRAINT account_phone_phone_guid_fkey FOREIGN KEY (phone_guid) REFERENCES powerapps.phone (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_phone OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.account_phone TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.account_phone TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.account_phone TO rl_powerapps_w;
GO