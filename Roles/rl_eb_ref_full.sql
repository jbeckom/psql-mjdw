DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_ref_full')
		THEN CREATE ROLE rl_eb_ref_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_ref TO rl_eb_ref_full;
GO 

grant rl_eb_ref_a to rl_eb_ref_full;
go

grant rl_eb_ref_c to rl_eb_ref_full;
go

grant rl_eb_ref_d to rl_eb_ref_full;
go

grant rl_eb_ref_r to rl_eb_ref_full;
go

grant rl_eb_ref_w to rl_eb_ref_full;
go

grant rl_eb_ref_x to rl_eb_ref_full;
go