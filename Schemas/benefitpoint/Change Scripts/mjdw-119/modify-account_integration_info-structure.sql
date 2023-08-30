/****************/
/*** FUNCTION ***/
/****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_account_integration_info_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_account_integration_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account_integration_info (
		 account_id
		,sagitta_client_id
		,source_code
		,primary_sales_lead_int_code
		,primary_service_lead_int_code
		,ams_customer_id
		,ams_customer_number
	)
	SELECT 	 account_id
			,sagitta_client_id
			,source_code
			,primary_sales_lead_int_code
			,primary_service_lead_int_code
			,ams_customer_id
			,ams_customer_number::int
	FROM 	benefitpoint.stg_account_integration_info 
	ON CONFLICT (account_id, sagitta_client_id) DO UPDATE 
	SET 	 source_code 					= excluded.source_code
			,primary_sales_lead_int_code 	= excluded.primary_sales_lead_int_code
			,primary_service_lead_int_code 	= excluded.primary_service_lead_int_code
			,ams_customer_id 				= excluded.ams_customer_id
			,ams_customer_number 			= excluded.ams_customer_number
	WHERE 	(account_integration_info.source_code,account_integration_info.primary_sales_lead_int_code,account_integration_info.primary_service_lead_int_code,account_integration_info.ams_customer_id,account_integration_info.ams_customer_number) 
		IS DISTINCT FROM 	(excluded.source_code,excluded.primary_sales_lead_int_code,excluded.primary_service_lead_int_code,excluded.ams_customer_id,excluded.ams_customer_number);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_integration_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_integration_info_upsert() TO rl_benefitpoint_x;
GO 
