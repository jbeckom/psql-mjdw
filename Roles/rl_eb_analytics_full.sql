DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_eb_analytics_full')
		THEN CREATE ROLE rl_eb_analytics_full;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA eb_analytics TO rl_eb_analytics_full;
GO 

grant rl_eb_analytics_a to rl_eb_analytics_full;
go

grant rl_eb_analytics_c to rl_eb_analytics_full;
go

grant rl_eb_analytics_d to rl_eb_analytics_full;
go

grant rl_eb_analytics_r to rl_eb_analytics_full;
go

grant rl_eb_analytics_w to rl_eb_analytics_full;
go

grant rl_eb_analytics_x to rl_eb_analytics_full;
go