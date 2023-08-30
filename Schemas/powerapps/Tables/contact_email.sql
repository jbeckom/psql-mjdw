CREATE TABLE IF NOT EXISTS powerapps.contact_email (
	 contact_guid 	uuid 		NOT NULL 
	,email_guid 	uuid 		NOT NULL 
	,email_type 	TEXT 		NULL 
	,ce_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,ce_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT contact_email_type_uid UNIQUE (contact_guid, email_guid, email_type)
	,CONSTRAINT contact_email_contact_guid_fkey FOREIGN KEY (contact_guid) REFERENCES powerapps.contact (guid) ON DELETE CASCADE 
	,CONSTRAINT contact_email_email_guid_fkey FOREIGN KEY (email_guid) REFERENCES powerapps.email (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact_email OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.contact_email TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.contact_email TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.contact_email TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER prevent_modify_u BEFORE UPDATE OF contact_guid, email_guid ON powerapps.contact_email FOR EACH ROW EXECUTE FUNCTION powerapps.tr_prevent_modify();
GO