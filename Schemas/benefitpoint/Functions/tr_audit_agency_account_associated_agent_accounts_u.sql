CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_associated_accounts (
		 agency_account_id 
		,old_associated_agent_account_id 
		,new_associated_agent_accont_id
		,audit_action 
	)
	SELECT 	 OLD.agency_account_id 
			,OLD.associated_agent_account_id 
			,NEW.associated_agent_account_id 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_u() TO rl_benefitpoint_x;
GO 
