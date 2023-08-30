DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_miedge_x')
		THEN CREATE ROLE rl_miedge_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA miedge TO rl_miedge_x;
GO 
