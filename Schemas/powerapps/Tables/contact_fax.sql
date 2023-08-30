CREATE TABLE IF NOT EXISTS powerapps.contact_fax (
	 contact_guid 	uuid 		NOT NULL 
	,fax_guid 		uuid 		NOT NULL 
	,fax_type 		TEXT 		NULL 
	,cf_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,cf_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT contact_fax_type_uid UNIQUE (contact_guid, fax_guid, fax_type)
	,CONSTRAINT contact_fax_contact_guid_fkey FOREIGN KEY (contact_guid) REFERENCES powerapps.contact (guid) ON DELETE CASCADE 
	,CONSTRAINT contact_fax_fax_guid_fkey FOREIGN KEY (fax_guid) REFERENCES powerapps.fax (guid) ON DELETE CASCADE
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact_fax OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.contact_fax TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.contact_fax TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.contact_fax TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER prevent_modify_u BEFORE UPDATE OF contact_guid, fax_guid ON powerapps.contact_fax FOR EACH ROW EXECUTE FUNCTION powerapps.tr_prevent_modify();
GO