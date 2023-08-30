DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_maintenance_c')
		THEN CREATE ROLE rl_maintenance_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA maintenance TO rl_maintenance_c;
GO 

GRANT CREATE ON SCHEMA maintenance to rl_maintenance_c;
go 