CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_integration_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_integration_info (
		 account_id
		,sagitta_client_id
		,new_source_code
		,new_primary_sales_lead_int_code
		,new_primary_service_lead_int_code
		,new_ams_customer_id
		,new_ams_customer_number
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.sagitta_client_id
			,NEW.source_code
			,NEW.primary_sales_lead_int_code
			,NEW.primary_service_lead_int_code
			,NEW.ams_customer_id
			,NEW.ams_customer_number
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_integration_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_integration_info_i() TO rl_benefitpoint_x;
GO 
