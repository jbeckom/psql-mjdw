DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_p_and_c_c')
		THEN CREATE ROLE rl_p_and_c_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_p_and_c_c;
GO 

GRANT CREATE on SCHEMA p_and_c to rl_p_and_c_c;
go 