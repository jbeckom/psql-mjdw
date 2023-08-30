CREATE OR REPLACE FUNCTION sagitta.fn_int_date (intdate int)
RETURNS date 
LANGUAGE plpgsql
AS $$

BEGIN 
	RETURN (
		SELECT 	('12/31/1967'::date + INTERVAL '1 day' * intdate)
	);
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.fn_int_date (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.fn_int_date(int) TO rl_sagitta_x;
GO 
