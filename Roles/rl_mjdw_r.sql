DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_mjdw_r')
		THEN CREATE ROLE rl_mjdw_r;
	END IF;
END;
$$;
GO 

GRANT rl_benefitpoint_r TO rl_mjdw_r;
GO 

GRANT rl_config_r TO rl_mjdw_r;
GO 

GRANT rl_miedge_r TO rl_mjdw_r;
GO 

GRANT rl_powerapps_r TO rl_mjdw_r;
GO 

GRANT rl_public_r TO rl_mjdw_r;
GO 

GRANT rl_sagitta_r TO rl_mjdw_r;
GO 
