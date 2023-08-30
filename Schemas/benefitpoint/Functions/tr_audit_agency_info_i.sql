CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_info (
		 account_id 
		,new_email 
		,new_taxpayer_id 
		,new_budgeted_total_annual_premium 
		,new_budgeted_total_annual_revenue
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.email 
			,NEW.taxpayer_id 
			,NEW.budgeted_total_annual_premium 
			,NEW.budgeted_total_annual_revenue 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_info_i() TO rl_benefitpoint_x;
GO 
