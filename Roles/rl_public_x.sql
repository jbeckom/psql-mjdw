DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_public_x')
		THEN CREATE ROLE rl_public_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA public TO rl_public_x;
GO 
