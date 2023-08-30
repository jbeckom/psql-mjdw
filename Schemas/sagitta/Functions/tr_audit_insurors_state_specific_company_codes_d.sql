CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_state_specific_company_codes (
		 sagitem 
		,lis 
		,code_state 
		,state_company_code 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.code_state 
			,OLD.state_company_code 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_d() TO rl_sagitta_x;
GO 
