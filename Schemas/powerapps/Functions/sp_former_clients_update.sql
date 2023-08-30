CREATE OR REPLACE FUNCTION powerapps.sp_former_clients_update() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	UPDATE 	 powerapps.account 	AS a
	SET 	 current_eb_client 	= FALSE 
			,current_pc_client 	= FALSE 
			,former_mj_client 	= TRUE 
			,status_reason 		= 'Prospect'
	WHERE 	former_mj_client != TRUE
		AND NOT EXISTS (
		SELECT 	1
		FROM 	powerapps.stg_current_clients 	AS cc
		WHERE 	cc.account_source 		= a.account_source 
			AND cc.source_key::TEXT 	= a.source_key::TEXT 
	);

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_former_clients_update() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_former_clients_update() TO rl_powerapps_x;
GO 
