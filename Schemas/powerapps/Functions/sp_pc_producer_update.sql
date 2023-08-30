CREATE OR REPLACE FUNCTION powerapps.sp_pc_producer_update()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	UPDATE 	powerapps.account 
	SET 	pc_producer = stg.producer 
	FROM 	powerapps.stg_current_producers AS stg
	WHERE 	stg.pol_type = 'PC'
		AND account.source_key::TEXT = stg.client_cd::TEXT 
		AND (account.pc_producer IS NULL OR account.pc_producer <> stg.producer);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_pc_producer_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_pc_producer_update TO rl_powerapps_x;
GO 
