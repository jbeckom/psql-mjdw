DROP FUNCTION IF EXISTS sagitta.fn_clients_last_entry();
GO 

CREATE OR REPLACE FUNCTION sagitta.tfn_clients_last_entry()
RETURNS TABLE (last_mod_date int, last_mod_time int)
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN query 
	SELECT 	 max(audit_entry_dt) 	AS last_mod_dt
			,(
				SELECT 	max(audit_time)
				FROM 	sagitta.clients 
				WHERE 	audit_entry_dt IN (
					SELECT 	max(audit_entry_dt)
					FROM 	sagitta.clients
				)
			) 						AS last_mod_time
	FROM 	sagitta.clients;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tfn_clients_last_entry() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tfn_clients_last_entry() TO rl_sagitta_x;
GO 