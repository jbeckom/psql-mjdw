CREATE OR REPLACE FUNCTION sagitta.sp_staff_commission_group_delete(_sagitem varchar(5))
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;

BEGIN 
	rc := 0;

	DELETE FROM sagitta.staff_commission_group
	WHERE 	sagitem = _sagitem;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_staff_commission_group_delete(varchar) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_staff_commission_group_delete(varchar) TO rl_sagitta_x;
GO 
