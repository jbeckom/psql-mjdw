DROP FUNCTION IF EXISTS powerapps.fn_address_last_update(text,text);
GO 

CREATE OR REPLACE FUNCTION powerapps.fn_address_last_update(_address_source TEXT, _source_type TEXT) 
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN 	(
		SELECT 	max(modify_dt)
		FROM 	powerapps.address 
		WHERE 	address_source 	= _address_source 
			AND source_type 	= _source_type
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_address_last_update(TEXT, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.fn_address_last_update(TEXT, text) TO rl_powerapps_x;
GO 
