DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'lgadmin')
		THEN CREATE USER lgadmin;
	END IF;
END;
$$;
GO 

GRANT rl_powerapps_a TO lgadmin;
GO 

GRANT rl_powerapps_r TO lgadmin;
GO 

GRANT rl_powerapps_w TO lgadmin;
GO 

GRANT rl_powerapps_x TO lgadmin;
GO 

grant rl_benefitpoint_r to lgadmin;
go 

grant rl_sagitta_r to lgadmin;
go 

grant rl_psj_r to lgadmin;
go 