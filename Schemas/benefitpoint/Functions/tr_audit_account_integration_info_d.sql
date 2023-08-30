CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_integration_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_integration_info (
		 account_id
		,sagitta_client_id
		,old_source_code
		,old_primary_sales_lead_int_code
		,old_primary_service_lead_int_code
		,old_ams_customer_id
		,old_ams_customer_number
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.sagitta_client_id
			,OLD.source_code
			,OLD.primary_sales_lead_int_code
			,OLD.primary_service_lead_int_code
			,OLD.ams_customer_id
			,OLD.ams_customer_number
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_integration_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_integration_info_d() TO rl_benefitpoint_x;
GO 
