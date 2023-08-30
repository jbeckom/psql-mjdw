/****************/
/*** FUNCTION ***/
/****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_ams360_account_business_type_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_ams360_account_business_type_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.ams360_account_business_type (
		 account_id
		,is_benefits
		,is_commercial
		,is_financial
		,is_health
		,is_life
		,is_non_property_and_casualty
		,is_personal
	)
	SELECT 	 account_id
			,is_benefits
			,is_commercial
			,is_financial
			,is_health
			,is_life
			,is_non_property_and_casualty
			,is_personal
	FROM 	benefitpoint.stg_ams360_account_business_type 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 is_benefits 					= excluded.is_benefits
			,is_commercial 					= excluded.is_commercial
			,is_financial 					= excluded.is_financial
			,is_health 						= excluded.is_health
			,is_life 						= excluded.is_life
			,is_non_property_and_casualty 	= excluded.is_non_property_and_casualty
			,is_personal 					= excluded.is_personal
	WHERE 	(ams360_account_business_type.is_benefits,ams360_account_business_type.is_commercial,ams360_account_business_type.is_financial,ams360_account_business_type.is_health,ams360_account_business_type.is_life,ams360_account_business_type.is_non_property_and_casualty,ams360_account_business_type.is_personal) 
		IS DISTINCT FROM 	(excluded.is_benefits,excluded.is_commercial,excluded.is_financial,excluded.is_health,excluded.is_life,excluded.is_non_property_and_casualty,excluded.is_personal);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_ams360_account_business_type_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_ams360_account_business_type_upsert() TO rl_benefitpoint_x;
GO 
