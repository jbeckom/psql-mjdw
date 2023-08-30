CREATE FUNCTION sagitta.tr_audit_insurors_admitted_states_d ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_insurors_admitted_states (
		 sagitem
		,lis
		,state_code 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.state_code 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_insurors_admitted_states_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_insurors_admitted_states_d() TO rl_sagitta_x;
GO 
