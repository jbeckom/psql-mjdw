CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_div_dept_designations_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_div_dept_designations (
		 sagitem 
		,lis 
		,valid_div 
		,valid_dept 
		,new_limit_new 
		,new_limit_new_date 
		,new_limit_renew 
		,new_limit_renew_date 
		,audit_action
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.valid_div 
			,NEW.valid_dept 
			,NEW.limit_new 
			,NEW.limit_new_date 
			,NEW.limit_renew 
			,NEW.limit_renew_date 
			,'I'; 
	RETURN NEW; 
END;
$$;
GO; 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_div_dept_designations_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_div_dept_designations_i() TO rl_sagitta_x;
GO 
