ALTER TABLE powerapps.account 
	 DROP CONSTRAINT IF EXISTS account_guid_uid
	,DROP CONSTRAINT IF EXISTS account_pkey 
	,ADD CONSTRAINT account_pkey PRIMARY KEY (guid)
	,ADD CONSTRAINT account_source_key_uid UNIQUE (account_source, source_key);
GO 

ALTER TABLE powerapps.address 
	 DROP CONSTRAINT IF EXISTS address_pkey 
	,DROP CONSTRAINT IF EXISTS address_guid_uid CASCADE 
	,ADD CONSTRAINT address_pkey PRIMARY KEY (guid)
	,ADD CONSTRAINT address_source_type_key UNIQUE (address_source, source_type, source_key, source_address_type);
GO 

ALTER TABLE powerapps.contact 
	 DROP CONSTRAINT IF EXISTS contact_guid_uid CASCADE 
	,DROP CONSTRAINT IF EXISTS contact_pkey 
	,ADD CONSTRAINT contact_pkey PRIMARY KEY (guid) 
	,ADD CONSTRAINT contact_source_key UNIQUE (contact_source, source_key);
GO 

ALTER TABLE powerapps.email 
	 DROP CONSTRAINT IF EXISTS email_guid_uid CASCADE 
	,DROP CONSTRAINT IF EXISTS email_pkey 
	,ADD CONSTRAINT email_pkey PRIMARY KEY (guid) 
	,ADD CONSTRAINT email_source_type_key_uid UNIQUE (email_source, source_type, source_key, source_email_type);
GO 

ALTER TABLE powerapps.fax 
	 DROP CONSTRAINT IF EXISTS fax_guid_uid CASCADE 
	,DROP CONSTRAINT IF EXISTS fax_pkey 
	,ADD CONSTRAINT fax_pkey PRIMARY KEY (guid)
	,ADD CONSTRAINT fax_source_type_key_uid UNIQUE (fax_source, source_type, source_key, source_fax_type);
GO 

ALTER TABLE powerapps.phone 
	 DROP CONSTRAINT IF EXISTS phone_guid_uid CASCADE 
	,DROP CONSTRAINT IF EXISTS phone_pkey 
	,ADD CONSTRAINT phone_pkey PRIMARY KEY (guid) 
	,ADD CONSTRAINT phone_source_type_key_uid UNIQUE (phone_source, source_type, source_key, source_phone_type, phone);
GO 

ALTER TABLE powerapps.social_media 
	 DROP CONSTRAINT IF EXISTS social_media_pkey CASCADE 
	,DROP CONSTRAINT IF EXISTS source_key_uid 
	,ADD CONSTRAINT social_media_pkey PRIMARY KEY (guid) 
	,ADD CONSTRAINT social_media_source_key_uid UNIQUE (social_media_source, source_key);
GO 
