DO $$
BEGIN 
	ALTER TABLE powerapps.suspect
		 ALTER COLUMN created_on DROP NOT NULL
		,ALTER COLUMN created_by DROP NOT NULL;
END;
$$;
GO 
