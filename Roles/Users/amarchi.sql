DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'amarchi')
		THEN CREATE USER amarchi WITH login;
	END IF;
END;
$$;
go 


/*** GROUPS / ROLES ***/
grant rl_pc_rpa_developer to amarchi;
go 