DO 
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'rl_benefitpoint_w')
		THEN CREATE ROLE rl_benefitpoint_w;
	END IF;
END;
$$;
GO 

GRANT USAGE ON SCHEMA benefitpoint TO rl_benefitpoint_w;
GO 
