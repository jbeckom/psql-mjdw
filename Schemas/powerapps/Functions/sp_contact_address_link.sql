CREATE OR REPLACE FUNCTION powerapps.sp_contact_address_link (_contact_source TEXT, _contact_source_key TEXT, _address_source_key TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	INSERT INTO powerapps.contact_address (contact_guid, address_guid, address_type, ca_owner)
	SELECT 	c.guid, a.guid, a.address_type, a.address_owner 
	FROM 	powerapps.contact 	AS c
		INNER JOIN 	powerapps.address 	AS a
			ON 	c.contact_source 	= a.address_source 
			AND c.source_key::TEXT 	= split_part(a.source_key, '-', 1)
	WHERE 	c.contact_source 	= upper (_contact_source)
		AND c.source_key 		= _contact_source_key
		AND a.source_key 		= _address_source_key;
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_contact_address_link (TEXT, TEXT, TEXT) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.sp_contact_address_link TO rl_powerapps_x;
GO