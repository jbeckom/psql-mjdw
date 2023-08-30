CREATE OR REPLACE FUNCTION sagitta.sp_insurors_state_specific_company_codes_insert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.insurors_state_specific_company_codes (
		 sagitem 
		,lis 
		,code_state 
		,state_company_code 
	)
	SELECT 	 sagitem 
			,lis 
			,code_state 
			,state_company_code 
	FROM 	sagitta.stg_insurors_state_specific_company_codes 
	ON CONFLICT (sagitem,lis,code_state,state_company_code) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_insurors_state_specific_company_codes_insert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_insurors_state_specific_company_codes_insert() TO rl_sagitta_x;
GO 
