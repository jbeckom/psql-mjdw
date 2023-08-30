DO
$$

BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_sagitta_c')
		THEN CREATE ROLE rl_sagitta_c;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA sagitta TO rl_sagitta_c;
GO 

GRANT CREATE ON SCHEMA sagitta TO rl_sagitta_c;
GO
