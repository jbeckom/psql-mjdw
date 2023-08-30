CREATE OR REPLACE FUNCTION sagitta.sp_insurors_admitted_states_delete() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	DELETE FROM sagitta.insurors_admitted_states AS ias
	WHERE EXISTS (
		SELECT 	1
		FROM 	sagitta.stg_insurors_admitted_states AS stg
		WHERE 	stg.sagitem = ias.sagitem
			AND stg.lis = ias.lis
	)
		AND NOT EXISTS (
			SELECT 	1
			FROM 	sagitta.stg_insurors_admitted_states AS stg
			WHERE 	stg.sagitem 	= ias.sagitem
				AND stg.lis 		= ias.lis
				AND stg.state_code 	= ias.state_code
		);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_admitted_states_delete() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_admitted_states_delete() TO rl_sagitta_x;
GO 
