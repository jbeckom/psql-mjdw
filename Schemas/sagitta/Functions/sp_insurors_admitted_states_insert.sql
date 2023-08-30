CREATE OR REPLACE FUNCTION sagitta.sp_insurors_admitted_states_insert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.insurors_admitted_states (
		 sagitem 
		,lis 
		,state_code 
	)
	SELECT 	 sagitem 
			,lis 
			,state_code 
	FROM 	sagitta.stg_insurors_admitted_states 
	ON CONFLICT (sagitem,lis,state_code) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_admitted_states_insert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_admitted_states_insert() TO rl_sagitta_x;
GO 
