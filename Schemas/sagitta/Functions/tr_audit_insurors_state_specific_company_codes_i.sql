CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_i()
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
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.code_state 
			,NEW.state_company_code 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_state_specific_company_codes_i() TO rl_sagitta_x;
GO 
