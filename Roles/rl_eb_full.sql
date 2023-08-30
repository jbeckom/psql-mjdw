DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_full')
		THEN CREATE ROLE rl_eb_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb TO rl_eb_full;
GO 

grant rl_eb_a to rl_eb_full;
go

grant rl_eb_c to rl_eb_full;
go

grant rl_eb_d to rl_eb_full;
go

grant rl_eb_r to rl_eb_full;
go

grant rl_eb_w to rl_eb_full;
go

grant rl_eb_x to rl_eb_full;
go