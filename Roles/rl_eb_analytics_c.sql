DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_analytics_c')
		THEN CREATE ROLE rl_eb_analytics_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_analytics TO rl_eb_analytics_c;
GO 

GRANT CREATE ON SCHEMA eb_analytics TO rl_eb_analytics_c;
GO