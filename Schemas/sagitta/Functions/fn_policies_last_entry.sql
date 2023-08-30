CREATE OR REPLACE FUNCTION sagitta.fn_policies_last_entry()
RETURNS date 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	('12/31/1967'::date + INTERVAL '1 day' * max(audit_entry_dt::int))::date
		FROM 	sagitta.policies
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.fn_policies_last_entry() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.fn_policies_last_entry() TO rl_sagitta_x;
GO 
