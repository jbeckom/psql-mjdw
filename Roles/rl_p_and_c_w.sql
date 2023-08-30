DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_p_and_c_w')
		THEN CREATE ROLE rl_p_and_c_w;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_p_and_c_w;
GO 
