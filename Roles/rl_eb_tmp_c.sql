DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_tmp_c')
		THEN CREATE ROLE rl_eb_tmp_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_tmp TO rl_eb_tmp_c;
GO 

GRANT CREATE ON SCHEMA eb_tmp TO rl_eb_tmp_c;
GO