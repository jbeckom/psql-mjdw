/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.common_group_account_info 
	 ALTER COLUMN account_funding_type SET DATA TYPE TEXT USING account_funding_type::TEXT
	,ALTER COLUMN primary_industry SET DATA TYPE TEXT USING primary_industry::TEXT 
	,ALTER COLUMN secondary_industry SET DATA TYPE TEXT USING secondary_industry::TEXT;
GO 

DROP TYPE IF EXISTS benefitpoint.account_funding_type;
GO 

DROP TYPE IF EXISTS benefitpoint.industry_type;
GO 

/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_common_group_account_info_upsert(int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_common_group_account_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.common_group_account_info (
		 account_id
		,number_of_retirees
		,number_of_retirees_as_of
		,year_established
		,account_funding_type
		,primary_industry
		,secondary_industry
		,other_primary_industry
		,other_secondary_industry
		,tax_payer_id
		,website
	)
	SELECT 	 account_id
			,number_of_retirees
			,number_of_retirees_as_of
			,year_established
			,account_funding_type
			,primary_industry
			,secondary_industry
			,other_primary_industry
			,other_secondary_industry
			,tax_payer_id
			,website
	FROM 	benefitpoint.stg_common_group_account_info
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 number_of_retirees 		= excluded.number_of_retirees
			,number_of_retirees_as_of 	= excluded.number_of_retirees_as_of
			,year_established 			= excluded.year_established
			,account_funding_type 		= excluded.account_funding_type
			,primary_industry 			= excluded.primary_industry
			,secondary_industry 		= excluded.secondary_industry
			,other_primary_industry 	= excluded.other_primary_industry
			,other_secondary_industry 	= excluded.other_secondary_industry
			,tax_payer_id 				= excluded.tax_payer_id
			,website 					= excluded.website
	WHERE 	(common_group_account_info.number_of_retirees,common_group_account_info.number_of_retirees_as_of,common_group_account_info.year_established,common_group_account_info.account_funding_type,common_group_account_info.primary_industry,common_group_account_info.secondary_industry,common_group_account_info.other_primary_industry,common_group_account_info.other_secondary_industry,common_group_account_info.tax_payer_id,common_group_account_info.website)
		IS DISTINCT FROM 	(excluded.number_of_retirees,excluded.number_of_retirees_as_of,excluded.year_established,excluded.account_funding_type,excluded.primary_industry,excluded.secondary_industry,excluded.other_primary_industry,excluded.other_secondary_industry,excluded.tax_payer_id,excluded.website);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_common_group_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_common_group_account_info_upsert() TO rl_benefitpoint_x;
GO 
