DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_tmp_full')
		THEN CREATE ROLE rl_eb_tmp_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_tmp TO rl_eb_tmp_full;
GO 

grant rl_eb_tmp_a to rl_eb_tmp_full;
go

grant rl_eb_tmp_c to rl_eb_tmp_full;
go

grant rl_eb_tmp_d to rl_eb_tmp_full;
go

grant rl_eb_tmp_r to rl_eb_tmp_full;
go

grant rl_eb_tmp_w to rl_eb_tmp_full;
go

grant rl_eb_tmp_x to rl_eb_tmp_full;
go