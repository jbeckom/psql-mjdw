ALTER TABLE powerapps.address 
	ALTER COLUMN address_type DROP NOT NULL;
GO 

ALTER TABLE powerapps.email 
	ALTER COLUMN email_type DROP NOT NULL;
GO 

ALTER TABLE powerapps.fax 
	ALTER COLUMN fax_type DROP NOT NULL;
GO 

ALTER TABLE powerapps.phone 
	ALTER COLUMN phone_type DROP NOT NULL;
GO 