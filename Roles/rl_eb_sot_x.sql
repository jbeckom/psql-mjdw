DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_sot_x')
		THEN CREATE ROLE rl_eb_sot_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_sot TO rl_eb_sot_x;
GO 
