CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,old_email 
		,new_email 
		,old_taxpayer_id 
		,new_taxpayer_id 
		,old_budgeted_total_annual_premium 
		,new_budgeted_total_annual_premium 
		,old_budgeted_total_annual_revenue 
		,new_budgeted_total_annual_revenue 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.email 
			,NEW.email 
			,OLD.taxpayer_id 
			,NEW.taxpayer_id 
			,OLD.budgeted_total_annual_premium 
			,NEW.budgeted_total_annual_premium 
			,OLD.budgeted_total_annual_revenue 
			,NEW.budgeted_total_annual_revenue 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_info_u() TO rl_benefitpoint_x;
GO 
