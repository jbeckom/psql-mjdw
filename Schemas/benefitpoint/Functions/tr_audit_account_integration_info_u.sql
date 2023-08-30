CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_integration_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_integration_info (
		 account_id
		,sagitta_client_id
		,old_source_code
		,new_source_code
		,old_primary_sales_lead_int_code
		,new_primary_sales_lead_int_code
		,old_primary_service_lead_int_code
		,new_primary_service_lead_int_code
		,old_ams_customer_id
		,new_ams_customer_id
		,old_ams_customer_number
		,new_ams_customer_number
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.sagitta_client_id
			,OLD.source_code
			,NEW.source_code
			,OLD.primary_sales_lead_int_code
			,NEW.primary_sales_lead_int_code
			,OLD.primary_service_lead_int_code
			,NEW.primary_service_lead_int_code
			,OLD.ams_customer_id
			,NEW.ams_customer_id
			,OLD.ams_customer_number
			,NEW.ams_customer_number
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_integration_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_integration_info_u() TO rl_benefitpoint_x;
GO 
