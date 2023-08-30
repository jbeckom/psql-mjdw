CREATE OR REPLACE FUNCTION powerapps.fn_contact_last_update (_contact_source TEXT)
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	max(c.modify_dt) 	AS last_mod
		FROM 	powerapps.contact 	AS c
		WHERE 	c.contact_source 	= upper (_contact_source)
	);
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_contact_last_update(TEXT) OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.fn_contact_last_update TO rl_powerapps_x;
GO