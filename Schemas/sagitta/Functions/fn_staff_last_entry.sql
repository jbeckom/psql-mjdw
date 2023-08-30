CREATE OR REPLACE FUNCTION sagitta.fn_staff_last_entry()
RETURNS int 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RETURN (
		SELECT 	max(audit_entry_dt::int)
		FROM 	sagitta.staff
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.fn_staff_last_entry() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.fn_staff_last_entry() TO rl_sagitta_x;
GO 
