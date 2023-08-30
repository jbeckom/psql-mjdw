CREATE OR REPLACE FUNCTION powerapps.sp_contact_email_link (_contact_source TEXT, _contact_source_key TEXT, _email_source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;
	
	INSERT INTO powerapps.contact_email (contact_guid, email_guid, email_type)
	SELECT 	c.guid, e.guid, e.email_type
	FROM 	powerapps.contact 	AS c
		INNER JOIN powerapps.email 	AS e
			ON 	c.contact_source 	= e.email_source 
			AND c.source_key::TEXT 	= split_part(e.source_key, '-', 1)
	WHERE 	c.contact_source 	= upper (_contact_source )
		AND c.source_key 		= _contact_source_key 
		AND e.source_key 		= _email_source_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_email_link (TEXT, TEXT, TEXT) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_email_link TO rl_powerapps_x;
GO