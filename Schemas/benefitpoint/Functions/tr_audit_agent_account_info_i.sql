CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agent_account_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agent_account_info (
		 agency_account_id
		,new_account_id 
		,audit_action 
	)
	SELECT 	 NEW.agency_account_id 
			,NEW.account_id 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agent_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agent_account_info_i() TO rl_benefitpoint_x;
GO 
