DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_automation_full')
		THEN CREATE ROLE rl_eb_automation_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_automation TO rl_eb_automation_full;
GO 

grant rl_eb_automation_a to rl_eb_automation_full;
go

grant rl_eb_automation_c to rl_eb_automation_full;
go

grant rl_eb_automation_d to rl_eb_automation_full;
go

grant rl_eb_automation_r to rl_eb_automation_full;
go

grant rl_eb_automation_w to rl_eb_automation_full;
go

grant rl_eb_automation_x to rl_eb_automation_full;
go