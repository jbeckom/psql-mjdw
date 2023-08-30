DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM pg_catalog.pg_roles WHERE rolname = 'rl_sagitta_x')
		THEN CREATE ROLE rl_sagitta_x;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA sagitta TO rl_sagitta_x;
GO 

grant usage on schema audit to rl_sagitta_x;
go