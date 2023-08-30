DROP FUNCTION IF EXISTS sagitta.fn_contacts_last_entry();

CREATE OR REPLACE FUNCTION sagitta.tfn_contacts_last_entry()
RETURNS TABLE (last_mod_date int, last_mod_time int)
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN query 
	SELECT 	max(audit_entry_dt::int) 	AS last_mod_date
			,(
				SELECT 	max(audit_time)
				FROM 	sagitta.contacts 
				WHERE 	audit_entry_dt = (
					SELECT 	max(audit_entry_dt) 
					FROM 	sagitta.contacts
				)
			) 							AS last_mod_time
	FROM 	sagitta.contacts;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tfn_contacts_last_entry() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION sagitta.tfn_contacts_last_entry() TO rl_sagitta_x;
GO 
