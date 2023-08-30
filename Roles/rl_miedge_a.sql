DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_miedge_a') THEN 
		CREATE ROLE rl_miedge_a;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA miedge TO rl_miedge_a;
GO 
