DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_maintenance_full')
		THEN CREATE ROLE rl_maintenance_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA maintenance TO rl_maintenance_full;
GO 

grant rl_maintenance_a to rl_maintenance_full;
go 

grant rl_maintenance_c to rl_maintenance_full;
go 

grant rl_maintenance_d to rl_maintenance_full;
go 

grant rl_maintenance_r to rl_maintenance_full;
go 

grant rl_maintenance_w to rl_maintenance_full;
go 

grant rl_maintenance_x to rl_maintenance_full;
go 