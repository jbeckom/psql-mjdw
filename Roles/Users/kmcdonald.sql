DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'kmcdonald')
		THEN CREATE USER kmcdonald;
	END IF;
END;
$$;

/*** GROUPS / ROLES ***/
GRANT rl_mjdw_r TO kmcdonald;