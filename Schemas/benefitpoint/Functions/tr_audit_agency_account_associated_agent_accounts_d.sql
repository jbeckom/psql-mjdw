CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_associated_accounts (
		 agency_account_id 
		,old_associated_agent_account_id 
		,audit_action 
	)
	SELECT 	 OLD.agency_account_id 
			,OLD.associated_agent_account_id 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_associated_agent_accounts_d() TO rl_benefitpoint_x;
GO 
