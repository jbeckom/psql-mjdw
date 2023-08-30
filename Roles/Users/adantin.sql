DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'adantin')
		THEN CREATE USER adantin WITH login;
	END IF;
END;
$$;
GO 

/*** GROUPS / ROLES ***/
GRANT rl_mjdw_r TO adantin;
GO 