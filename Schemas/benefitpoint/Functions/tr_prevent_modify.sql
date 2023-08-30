CREATE OR REPLACE FUNCTION benefitpoint.tr_prevent_modify()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	RAISE EXCEPTION 'MODIFICATION OF THIS RECORD TYPE IS RESTRICTED';
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_prevent_modify() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_prevent_modify() TO rl_benefitpoint_x;
GO 
