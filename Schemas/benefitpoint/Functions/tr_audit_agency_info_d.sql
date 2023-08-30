CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,old_email 
		,old_taxpayer_id 
		,old_budgeted_total_annual_premium 
		,old_budgeted_total_annual_revenue
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.email 
			,OLD.taxpayer_id 
			,OLD.budgeted_total_annual_premium 
			,OLD.budgeted_total_annual_revenue 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_info_d() TO rl_benefitpoint_x;
GO 
