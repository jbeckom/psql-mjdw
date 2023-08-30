DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'rpauser')
		THEN CREATE USER rpauser;
	END IF;
END;
$$;
GO 

grant rl_benefitpoint_r to rpauser;
go 

grant rl_maintenance_r to rpauser;
go 

grant rl_maintenance_a to rpauser;
go 

grant rl_maintenance_w to rpauser;
go 

grant rl_p_and_c_r to rpauser;
go 

grant rl_pc_ops_r to rpauser;
go 

grant rl_powerapps_r to rpauser;
go 

grant rl_sagitta_r to rpauser;
go 

GRANT rl_mjdw_r TO rpauser;
GO 