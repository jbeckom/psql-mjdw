CREATE OR REPLACE FUNCTION powerapps.sp_contact_phone_link (_contact_source TEXT, _contact_source_key TEXT, _phone_source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO powerapps.contact_phone (contact_guid, phone_guid, phone_type)
	SELECT 	c.guid, p.guid, p.phone_type
	FROM 	powerapps.contact 	AS c
		INNER JOIN 	powerapps.phone 	AS p 
			ON 	c.contact_source 	= p.phone_source 
			AND c.source_key::TEXT 	= split_part(p.source_key, '-', 1)
	WHERE 	c.contact_source 	= upper (_contact_source) 
		AND c.source_key 		= _contact_source_key
		AND p.source_key 		= _phone_source_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_phone_link OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_phone_link TO rl_powerapps_x;
GO