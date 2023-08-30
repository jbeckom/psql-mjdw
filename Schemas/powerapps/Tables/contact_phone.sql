CREATE TABLE IF NOT EXISTS powerapps.contact_phone (
	 contact_guid 	uuid 		NOT NULL 
	,phone_guid 	uuid 		NOT NULL 
	,phone_type 	TEXT 		NULL 
	,cp_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,cp_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE
	,CONSTRAINT contact_phone_type UNIQUE (contact_guid, phone_guid, phone_type)
	,CONSTRAINT contact_phone_contact_guid_fkey FOREIGN KEY (contact_guid) REFERENCES powerapps.contact (guid) ON DELETE CASCADE 
	,CONSTRAINT contact_phone_phone_guid_fkey FOREIGN KEY (phone_guid) REFERENCES powerapps.phone (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact_phone OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.contact_phone TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.contact_phone TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.contact_phone TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER prevent_modify_u BEFORE UPDATE OF contact_guid, phone_guid ON powerapps.contact_phone FOR EACH ROW EXECUTE FUNCTION powerapps.tr_prevent_modify();
GO
