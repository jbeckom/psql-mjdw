DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_ref_a')
		THEN CREATE ROLE rl_eb_ref_a;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_ref TO rl_eb_ref_a;
GO 
