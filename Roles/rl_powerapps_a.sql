DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_powerapps_a')
		THEN CREATE ROLE rl_powerapps_a;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA powerapps TO rl_powerapps_a;
GO 
