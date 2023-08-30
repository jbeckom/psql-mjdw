DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_maintenance_w')
		THEN CREATE ROLE rl_maintenance_w;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA maintenance TO rl_maintenance_w;
GO 
