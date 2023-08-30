CREATE TABLE IF NOT EXISTS powerapps.contact_address(
	 contact_guid 	uuid 		NOT NULL 
	,address_guid 	uuid 		NOT NULL 
	,address_type 	TEXT 		NULL 
	,ca_owner 		TEXT 		NULL 
	,status 		TEXT 		NULL 
	,status_reason 	TEXT 		NULL 
	,ca_guid 		uuid 		NOT NULL 	DEFAULT public.uuid_generate_v4() 	PRIMARY KEY 
	,modify_dt 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,is_dirty 		bool 		NOT NULL 	DEFAULT TRUE 
	,CONSTRAINT contact_address_type_uid UNIQUE (contact_guid, address_guid, address_type)
	,CONSTRAINT contact_address_contact_guid_fkey FOREIGN KEY (contact_guid) REFERENCES powerapps.contact (guid) ON DELETE CASCADE 
	,CONSTRAINT contact_address_address_guid_fkey FOREIGN KEY (address_guid) REFERENCES powerapps.address (guid) ON DELETE CASCADE 
);
GO

/*** PERMISSIONS ***/
ALTER TABLE powerapps.contact_address OWNER TO mj_admin;
GO

GRANT INSERT ON powerapps.contact_address TO rl_powerapps_a;
GO

GRANT SELECT ON powerapps.contact_address TO rl_powerapps_r;
GO

GRANT UPDATE ON powerapps.contact_address TO rl_powerapps_w;
GO

/*** TRIGGERS ***/
CREATE TRIGGER prevent_modify_u BEFORE UPDATE OF contact_guid, address_guid ON powerapps.contact_address FOR EACH ROW EXECUTE FUNCTION powerapps.tr_prevent_modify();
GO