CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_agency_account_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_agency_account_info (
		 account_id 
		,new_agency_name 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.agency_name 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_agency_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_agency_account_info_i() TO rl_benefitpoint_x;
GO 
