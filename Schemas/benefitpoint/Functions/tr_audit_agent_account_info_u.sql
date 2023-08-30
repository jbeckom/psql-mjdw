CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agent_account_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agent_account_info (
		 agency_account_id
		,old_account_id 
		,new_account_id
		,audit_action 
	)
	SELECT 	 OLD.agency_account_id 
			,OLD.account_id 
			,NEW.account_id 
			,'U';
	RETURN OLD, NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agent_account_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agent_account_info_u() TO rl_benefitpoint_x;
GO 
