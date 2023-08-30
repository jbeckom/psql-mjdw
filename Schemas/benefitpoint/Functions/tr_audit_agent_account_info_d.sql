CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agent_account_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agent_account_info (
		 agency_account_id
		,old_account_id 
		,audit_action 
	)
	SELECT 	 OLD.agency_account_id 
			,OLD.account_id 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agent_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agent_account_info_d() TO rl_benefitpoint_x;
GO 
