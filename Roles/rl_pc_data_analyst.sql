DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_pc_data_analyst')
		THEN CREATE ROLE rl_pc_data_analyst;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_pc_data_analyst;
GO 

GRANT USAGE ON SCHEMA pc_ops TO rl_pc_data_analyst;
GO 

GRANT rl_sagitta_r TO rl_pc_data_analyst;
GO 
