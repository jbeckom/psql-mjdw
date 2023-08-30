DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'kconard')
		THEN CREATE USER kconard WITH login;
	END IF;
END;
$$;
go 


/*** GROUPS / ROLES ***/
grant rl_pc_data_analyst to kconard;
go 