CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_info (
		 account_id 
		,old_agency_name 
		,new_agnecy_name 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.agency_name 
			,NEW.agency_name 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_info_u() TO rl_benefitpoint_x;
GO 
