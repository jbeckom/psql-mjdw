CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agent_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agent_info (
		 account_id
		,old_email
		,old_tax_payer_id
		,old_budgeted_total_annual_premium
		,old_budgeted_total_annual_revenue
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.email
			,OLD.tax_payer_id
			,OLD.budgeted_total_annual_premium
			,OLD.budgeted_total_annual_revenue
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agent_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agent_info_d() TO rl_benefitpoint_x;
GO 
