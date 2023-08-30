DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_pc_ops_d')
		THEN CREATE ROLE rl_pc_ops_d;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA pc_ops TO rl_pc_ops_d;
GO 
