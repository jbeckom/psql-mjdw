CREATE OR REPLACE FUNCTION benefitpoint.sp_ams360_account_business_type_upsert (_account_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
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
	SELECT 	 _account_id 		AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isBenefits/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 				AS is_benefits 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isCommercial/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 				AS is_commercial 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isFinancial/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 				AS is_financial 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isHealth/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 					AS is_health 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isLife/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 					AS is_life 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isNonPropertyAndCasualty/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 	AS is_non_property_and_casualty 
			,REPLACE(regexp_replace(UNNEST(xpath('/ams360AccountBusinessType/isPersonal/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 				AS is_personal 
	FROM 	xmldata 
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
ALTER FUNCTION benefitpoint.sp_ams360_account_business_type_upsert (int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_ams360_account_business_type_upsert (int, text) TO rl_benefitpoint_x;
GO 
