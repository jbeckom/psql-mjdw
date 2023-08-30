DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_p_and_c_full')
		THEN CREATE ROLE rl_p_and_c_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_p_and_c_full;
GO 

grant rl_p_and_c_a to rl_p_and_c_full;
go

grant rl_p_and_c_c to rl_p_and_c_full;
go

grant rl_p_and_c_d to rl_p_and_c_full;
go

grant rl_p_and_c_r to rl_p_and_c_full;
go

grant rl_p_and_c_w to rl_p_and_c_full;
go

grant rl_p_and_c_x to rl_p_and_c_full;
go