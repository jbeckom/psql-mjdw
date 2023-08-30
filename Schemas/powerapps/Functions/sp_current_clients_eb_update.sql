CREATE OR REPLACE FUNCTION powerapps.sp_current_clients_eb_update()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	UPDATE 	powerapps.account AS a
	SET 	current_eb_client = TRUE 
			,status_reason = 'Client'
	WHERE current_eb_client != TRUE
		AND EXISTS (
			SELECT 	1
			FROM 	powerapps.stg_current_clients AS cc
			WHERE 	cc.account_source 	= 'BENEFITPOINT'
				AND cc.source_key::text	= a.source_key::text 
		);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_current_clients_eb_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_current_clients_eb_update() TO rl_powerapps_x;
GO
