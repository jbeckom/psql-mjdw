CREATE OR REPLACE FUNCTION sagitta.tr_prevent_update()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RAISE EXCEPTION 'UPDATES OF THIS RECORD TYPE IS PROHIBITED';
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_prevent_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_prevent_update() TO rl_sagitta_x;
GO 