CREATE OR REPLACE FUNCTION powerapps.fn_email_last_update(_email_source TEXT, _source_type TEXT) 
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	RETURN 	(
		SELECT 	max(modify_dt)
		FROM 	powerapps.email 
		WHERE 	email_source 	= _email_source 
			AND source_type 	= _source_type 
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_email_last_update(TEXT, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.fn_email_last_update(TEXT, TEXT) TO rl_powerapps_x;
GO 
