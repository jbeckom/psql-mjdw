CREATE OR REPLACE FUNCTION sagitta.tfn_eq_coverages_last_entry() 
RETURNS TABLE (last_mod_date int, last_mod_time int)
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	RETURN 	 query 
	SELECT 	 max(audit_entry_dt) 		AS last_mod_date
			,(
				SELECT 	max(audit_time_ind)
				FROM 	sagitta.eq_coverages 
				WHERE 	audit_entry_dt = (SELECT max(audit_entry_dt) FROM sagitta.eq_coverages)
			) 							AS last_mod_time 
	FROM 	sagitta.eq_coverages;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tfn_eq_coverages_last_entry() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tfn_eq_coverages_last_entry() TO rl_sagitta_x;
GO 
