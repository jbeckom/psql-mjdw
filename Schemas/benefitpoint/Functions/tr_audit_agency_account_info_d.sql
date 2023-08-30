CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_info (
		 account_id 
		,old_agency_name 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.agency_name 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_info_d() TO rl_benefitpoint_x;
GO 
