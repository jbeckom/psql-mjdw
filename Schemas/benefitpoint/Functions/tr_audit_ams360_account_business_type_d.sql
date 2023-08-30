CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_ams360_account_business_type_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_ams360_account_business_type (
		 ams_customer_number
		,old_is_benefits
		,old_is_commercial
		,old_is_financial
		,old_is_health
		,old_is_life
		,old_is_non_property_and_casualty
		,old_is_personal
		,audit_action
	)
	SELECT 	 OLD.ams_customer_number
			,OLD.is_benefits
			,OLD.is_commercial
			,OLD.is_financial
			,OLD.is_health
			,OLD.is_life
			,OLD.is_non_property_and_casualty
			,OLD.is_personal
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_ams360_account_business_type_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_ams360_account_business_type_d() TO rl_benefitpoint_x;
GO 
