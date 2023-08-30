DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_public_r')
		THEN CREATE ROLE rl_public_r;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA public TO rl_public_r;
GO 
