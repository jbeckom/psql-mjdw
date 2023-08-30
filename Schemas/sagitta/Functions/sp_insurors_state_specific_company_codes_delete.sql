CREATE OR REPLACE FUNCTION sagitta.sp_insurors_state_specific_company_codes_delete() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	DELETE FROM sagitta.insurors_state_specific_company_codes AS isscc
	WHERE EXISTS (
		SELECT 	1
		FROM 	sagitta.stg_insurors_state_specific_company_codes AS stg 
		WHERE 	stg.sagitem 	= isscc.sagitem
			AND stg.lis 		= isscc.lis
	)
		AND NOT EXISTS (
			SELECT 	1
			FROM 	sagitta.stg_insurors_state_specific_company_codes AS stg 
			WHERE 	stg.sagitem 			= isscc.sagitem 
				AND stg.lis 				= isscc.lis 
				AND stg.code_state 			= isscc.code_state 
				AND stg.state_company_code 	= isscc.state_company_code 
		);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_state_specific_company_codes_delete() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_state_specific_company_codes_delete() TO rl_sagitta_d;
GO 
