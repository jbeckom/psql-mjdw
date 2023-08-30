DO
$$

BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_powerapps_c')
		THEN CREATE ROLE rl_powerapps_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA powerapps TO rl_powerapps_c;
GO 

GRANT CREATE ON SCHEMA powerapps TO rl_powerapps_c;
GO 
