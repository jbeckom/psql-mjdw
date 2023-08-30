DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_pc_ops_c')
		THEN CREATE ROLE rl_pc_ops_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA pc_ops TO rl_pc_ops_c;
GO 

GRANT CREAT ON SCHEMA pc_ops to rl_pc_ops_c;
go 