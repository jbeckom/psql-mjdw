DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_miedge_r')
		THEN CREATE ROLE rl_miedge_r;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA miedge TO rl_miedge_r;
GO 
