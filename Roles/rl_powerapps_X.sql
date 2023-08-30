DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_powerapps_x')
		THEN CREATE ROLE rl_powerapps_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA powerapps TO rl_powerapps_x;
GO 
