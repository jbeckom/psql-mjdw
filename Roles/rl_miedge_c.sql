DO
$$

BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_miedge_c')
		THEN CREATE ROLE rl_miedge_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA miedge TO rl_miedge_c;
GO 

GRANT CREATE ON SCHEMA miedge TO rl_miedge_c;
GO 
