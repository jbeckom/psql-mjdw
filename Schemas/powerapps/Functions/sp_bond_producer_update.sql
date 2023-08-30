CREATE OR REPLACE FUNCTION powerapps.sp_bond_producer_update() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	UPDATE 	powerapps.account 
	SET 	bond_producer = stg.producer 
	FROM 	powerapps.stg_current_producers AS stg 
	WHERE 	stg.pol_type = 'BD'
		AND account.source_key::TEXT = stg.client_cd::TEXT 
		AND (account.bond_producer IS NULL OR account.bond_producer <> stg.producer);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_bond_producer_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_bond_producer_update() TO rl_powerapps_x;
GO 
