CREATE OR REPLACE FUNCTION powerapps.fn_phone_last_update(_phone_source TEXT, _source_type TEXT) 
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	RETURN (
		SELECT 	max(modify_dt) 
		FROM 	powerapps.phone 
		WHERE 	phone_source 	= _phone_source 
			AND source_type 	= _source_type 
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_phone_last_update(TEXT, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.fn_phone_last_update(TEXT, TEXT) TO rl_powerapps_x;
GO 
