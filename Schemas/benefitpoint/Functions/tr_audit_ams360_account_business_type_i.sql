CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_ams360_account_business_type_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_ams360_account_business_type (
		 ams_customer_number
		,new_is_benefits
		,new_is_commercial
		,new_is_financial
		,new_is_health
		,new_is_life
		,new_is_non_property_and_casualty
		,new_is_personal
		,audit_action
	)
	SELECT 	 NEW.ams_customer_number
			,NEW.is_benefits
			,NEW.is_commercial
			,NEW.is_financial
			,NEW.is_health
			,NEW.is_life
			,NEW.is_non_property_and_casualty
			,NEW.is_personal
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_ams360_account_business_type_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_ams360_account_business_type_i() TO rl_benefitpoint_x;
GO 
