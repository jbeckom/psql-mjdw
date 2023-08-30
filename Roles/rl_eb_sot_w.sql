DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_sot_w')
		THEN CREATE ROLE rl_eb_sot_w;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_sot TO rl_eb_sot_w;
GO 
