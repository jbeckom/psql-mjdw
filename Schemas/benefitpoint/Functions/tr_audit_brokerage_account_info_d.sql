CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_brokerage_account_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_brokerage_account_info (
		 account_id 
		,account_type 
		,old_account_number 
		,old_broker_of_record_as_of 
		,old_hipaa_required 
		,old_hipaa_signed_on
		,audit_action 
	)
	SELECT 	 OLD.account_id 
			,OLD.account_type 
			,OLD.account_number 
			,OLD.broker_of_record_as_of 
			,OLD.hipaa_required 
			,OLD.hipaa_signed_on 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_brokerage_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_brokerage_account_info_d() TO rl_benefitpoint_x;
GO 
