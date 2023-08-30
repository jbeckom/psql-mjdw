DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'nchopp')
		THEN CREATE USER nchopp WITH login;
	END IF;
END;
$$;
GO 

/*** GROUPS / ROLES ***/
grant rl_pc_rpa_developer to nchopp;
go 