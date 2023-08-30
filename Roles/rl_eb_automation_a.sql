DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_automation_a')
		THEN CREATE ROLE rl_eb_automation_a;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_automation TO rl_eb_automation_a;
GO 
