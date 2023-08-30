CREATE OR REPLACE FUNCTION sagitta.tr_audit_insurors_div_dept_designations_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_insurors_div_dept_designations (
		 sagitem 
		,lis 
		,valid_div 
		,valid_dept 
		,old_limit_new 
		,new_limit_new 
		,old_limit_new_date 
		,new_limit_new_date 
		,old_limit_renew 
		,new_limit_renew 
		,old_limit_renew_date 
		,new_limit_renew_date 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.valid_div 
			,OLD.valid_dept 
			,OLD.limit_new 
			,NEW.limit_new 
			,OLD.limit_new_date 
			,NEW.limit_new_date 
			,OLD.limit_renew 
			,NEW.limit_renew 
			,OLD.limit_renew_date 
			,NEW.limit_renew_date 
			,'U'; 
	RETURN OLD; 
END;
$$;
GO; 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_div_dept_designations_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_div_dept_designations_u() TO rl_sagitta_x;
GO 
