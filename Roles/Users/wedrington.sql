DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'wedrington')
		THEN CREATE USER wedrington;
	END IF;
END;
$$;
go 

/*** GROUPS / ROLES ***/
GRANT rl_mjdw_r TO wedrington;
go 

grant rl_p_and_c_full to wedrington;
go 

grant rl_pc_ops_full to wedrington;
go 