ALTER TABLE powerapps.suspect
	 DROP CONSTRAINT suspect_pkey;
GO 

ALTER TABLE powerapps.suspect 
	 ADD CONSTRAINT suspect_pkey PRIMARY KEY (suspect)
	,ADD CONSTRAINT source_id_lob_uid UNIQUE (suspect_source, source_id, line_of_business);
GO 