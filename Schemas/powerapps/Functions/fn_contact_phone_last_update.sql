CREATE OR REPLACE FUNCTION powerapps.fn_contact_phone_last_update() 
RETURNS timestamp 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	RETURN (
		SELECT 	max(modify_dt)
		FROM 	powerapps.contact_phone
	);
END;
$$;

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.fn_contact_phone_last_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.fn_contact_phone_last_update() TO rl_powerapps_x;
GO 
