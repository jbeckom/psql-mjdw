CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_associated_accounts (
		 agency_account_id 
		,new_associated_agent_account_id 
		,audit_action 
	)
	SELECT 	 NEW.agency_account_id 
			,NEW.associated_agent_account_id 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_i() TO rl_benefitpoint_x;
GO 
