DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_pc_rpa_developer')
		THEN CREATE ROLE rl_pc_rpa_developer;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA p_and_c TO rl_pc_rpa_developer;
GO 

GRANT USAGE ON SCHEMA pc_ops TO rl_pc_rpa_developer;
GO 

GRANT rl_mjdw_r TO rl_pc_rpa_developer;
GO 

