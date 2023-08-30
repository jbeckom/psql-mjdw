CREATE OR REPLACE FUNCTION sagitta.sp_insurors_non_admitted_states_delete() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	DELETE FROM sagitta.insurors_non_admitted_states AS inas
	WHERE EXISTS (
		SELECT 	1
		FROM 	sagitta.stg_insurors_non_admitted_states AS stg
		WHERE 	stg.sagitem = inas.sagitem
			AND stg.lis 	= inas.lis 
	)
		AND NOT EXISTS (
			SELECT 	1
			FROM 	sagitta.stg_insurors_non_admitted_states AS stg 
			WHERE 	stg.sagitem 	= inas.sagitem 
				AND stg.lis 		= inas.lis
				AND stg.state_code 	= inas.state_code 
		);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_non_admitted_states_delete() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_non_admitted_states_delete() TO rl_sagitta_x;
GO 
