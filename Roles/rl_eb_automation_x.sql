DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_automation_x')
		THEN CREATE ROLE rl_eb_automation_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_automation TO rl_eb_automation_x;
GO 
