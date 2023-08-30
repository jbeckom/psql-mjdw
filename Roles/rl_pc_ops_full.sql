DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_pc_ops_full')
		THEN CREATE ROLE rl_pc_ops_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_pc_ops_full;
GO 

grant rl_pc_ops_a to rl_pc_ops_full;
go

grant rl_pc_ops_c to rl_pc_ops_full;
go

grant rl_pc_ops_d to rl_pc_ops_full;
go

grant rl_pc_ops_r to rl_pc_ops_full;
go

grant rl_pc_ops_w to rl_pc_ops_full;
go

grant rl_pc_ops_x to rl_pc_ops_full;
go