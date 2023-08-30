DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_sot_full')
		THEN CREATE ROLE rl_eb_sot_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_sot TO rl_eb_sot_full;
GO 

grant rl_eb_sot_a to rl_eb_sot_full;
go

grant rl_eb_sot_c to rl_eb_sot_full;
go

grant rl_eb_sot_d to rl_eb_sot_full;
go

grant rl_eb_sot_r to rl_eb_sot_full;
go

grant rl_eb_sot_w to rl_eb_sot_full;
go

grant rl_eb_sot_x to rl_eb_sot_full;
go