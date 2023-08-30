DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'data_integration')
		THEN CREATE ROLE data_integration;
	END IF;
END;
$$;
GO 

/*** GROUPS / ROLES ***/
GRANT rl_powerapps_a TO data_integration;
GO 

GRANT rl_powerapps_r TO data_integration;
GO 

GRANT rl_powerapps_w TO data_integration;
GO 

GRANT rl_powerapps_c TO data_integration;
GO 

GRANT rl_powerapps_x TO data_integration;
GO 

GRANT rl_sagitta_r TO data_integration;
GO 

GRANT rl_sagitta_a TO data_integration;
GO 

GRANT rl_sagitta_w TO data_integration;
GO 

GRANT rl_sagitta_x TO data_integration;
GO 

GRANT rl_sagitta_d TO data_integration;
GO 

GRANT rl_public_r TO data_integration;
GO 

GRANT rl_benefitpoint_a TO data_integration;
GO 

GRANT rl_benefitpoint_c TO data_integration;
GO 

GRANT rl_benefitpoint_d TO data_integration;
GO 

GRANT rl_benefitpoint_r TO data_integration;
GO 

GRANT rl_benefitpoint_w TO data_integration;
GO 

GRANT rl_benefitpoint_x TO data_integration;
GO 

GRANT rl_miedge_r TO data_integration;
GO 

GRANT rl_miedge_a TO data_integration;
GO 

GRANT rl_miedge_w TO data_integration;
GO 

GRANT rl_miedge_c TO data_integration;
GO 

GRANT rl_psj_a TO data_integration;
GO 

GRANT rl_psj_c TO data_integration;
GO 

GRANT rl_psj_r TO data_integration;
GO 

GRANT rl_psj_w TO data_integration;
GO 

GRANT rl_psj_x TO data_integration;
GO 

grant rl_public_x to data_integration;
go 

grant rl_audit_a to data_integration;
go 