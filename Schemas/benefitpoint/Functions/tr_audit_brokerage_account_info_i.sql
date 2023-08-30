CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_brokerage_account_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_brokerage_account_info (
		 account_id 
		,account_type
		,new_account_number 
		,new_broker_of_record_as_of 
		,new_hipaa_required 
		,new_hipaa_signed_on
		,audit_action 
	)
	SELECT 	 NEW.account_id 
			,NEW.account_type 
			,NEW.account_number 
			,NEW.broker_of_record_as_of 
			,NEW.hipaa_required 
			,NEW.hipaa_signed_on 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_brokerage_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_brokerage_account_info_i() TO rl_benefitpoint_x;
GO 
