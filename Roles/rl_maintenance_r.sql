DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_maintenance_r')
		THEN CREATE ROLE rl_maintenance_r;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA maintenance TO rl_maintenance_r;
GO 
