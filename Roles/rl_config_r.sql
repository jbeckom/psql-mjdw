DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_config_r')
		THEN CREATE ROLE rl_config_r;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA config TO rl_config_r;
GO 
