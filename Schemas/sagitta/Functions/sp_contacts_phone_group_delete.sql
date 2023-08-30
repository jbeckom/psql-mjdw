CREATE OR REPLACE FUNCTION sagitta.sp_contacts_phone_group_delete(_sagitem int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	DELETE FROM sagitta.contacts_phone_group
	WHERE 	sagitem = _sagitem; 

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_contacts_phone_group_delete (int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_contacts_phone_group_delete(int) TO rl_sagitta_x;
GO 
