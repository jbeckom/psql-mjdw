ALTER TABLE powerapps.contact_tags RENAME TO contact_tag;
GO 

ALTER TABLE powerapps.contact_tag 
	RENAME COLUMN tag_detail_guid TO tag_guid;
GO 

ALTER TABLE powerapps.contact_tag 
	ALTER COLUMN modify_dt SET DATA TYPE timestamptz;
GO 
	
ALTER TABLE powerapps.contact_tag 
	ADD CONSTRAINT contact_tag_guid_uid UNIQUE (contact_guid, tag_guid);
GO 
	
GRANT UPDATE ON TABLE powerapps.contact_tag TO rl_powerapps_w;
GO 