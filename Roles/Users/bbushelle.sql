DO
$$
BEGIN 
	IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'bbushelle')
		THEN CREATE USER bbushelle;
	END IF;
END;
$$;
go 

/*** GROUPS / ROLES ***/
GRANT rl_mjdw_r TO bbushelle;
go 

grant rl_eb_analytics_full to bbushelle;
go 

grant rl_eb_automation_full to bbushelle;
go 

grant rl_eb_ref_full to bbushelle;
go 

grant rl_eb_sot_full to bbushelle;
go 

grant rl_eb_tmp_full to bbushelle;
go 

grant rl_eb_full to bbushelle;
go 