DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_ref_x')
		THEN CREATE ROLE rl_eb_ref_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_ref TO rl_eb_ref_x;
GO 
