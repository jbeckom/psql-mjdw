/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_brokerage_account_info_upsert(int, TEXT, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_brokerage_account_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.brokerage_account_info (
		 account_id
		,account_type
		,account_number
		,hipaa_required
		,broker_of_record_as_of
		,hipaa_signed_on 
	)
	SELECT 	 account_id
			,account_type
			,account_number
			,hipaa_required
			,broker_of_record_as_of
			,hipaa_signed_on
	FROM 	benefitpoint.stg_brokerage_account_info 
	ON CONFLICT (account_id, account_type) DO UPDATE 
	SET 	 account_number 			= excluded.account_number
			,hipaa_required 			= excluded.hipaa_required
			,broker_of_record_as_of 	= excluded.broker_of_record_as_of
			,hipaa_signed_on 			= excluded.hipaa_signed_on
	WHERE 	(brokerage_account_info.account_number,brokerage_account_info.hipaa_required,brokerage_account_info.broker_of_record_as_of,brokerage_account_info.hipaa_signed_on) 
		IS DISTINCT FROM 	(excluded.account_number,excluded.hipaa_required,excluded.broker_of_record_as_of,excluded.hipaa_signed_on);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_brokerage_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_brokerage_account_info_upsert() TO rl_benefitpoint_x;
GO 
