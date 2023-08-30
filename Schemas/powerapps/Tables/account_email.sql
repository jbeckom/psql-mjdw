CREATE TABLE IF NOT EXISTS powerapps.account_email(
	 account_guid 	uuid 	NOT NULL 
	,email_guid 	uuid 	NOT NULL 
	,email_type 	TEXT 	NULL 
	,ae_owner 		TEXT 	NULL 
	,status 		TEXT 	NULL 
	,status_reason 	TEXT 	NULL 
	,ae_guid 		uuid 	NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT account_email_type_uid UNIQUE (account_guid, email_guid, email_type)
	,CONSTRAINT account_email_account_guid_fkey FOREIGN KEY (account_guid) REFERENCES powerapps.account (guid) ON DELETE CASCADE
	,CONSTRAINT account_email_email_guid_fkey FOREIGN KEY (email_guid) REFERENCES powerapps.email (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.account_email OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.account_email TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.account_email TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.account_email TO rl_powerapps_w;
GO