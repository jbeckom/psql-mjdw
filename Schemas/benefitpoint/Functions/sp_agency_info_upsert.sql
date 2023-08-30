CREATE OR REPLACE FUNCTION benefitpoint.sp_agency_info_upsert (_account_id int, _xmldata TEXT) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.agency_info (
		 account_id 
		,email 
		,taxpayer_id 
		,budgeted_total_annual_premium 
		,budgeted_total_annual_revenue 
	)
	
	SELECT 	 _account_id 		AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/agencyInfo/email/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 											AS email 
			,REPLACE(regexp_replace(UNNEST(xpath('/agencyInfo/taxPayerID/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 										AS taxpayer_id
			,REPLACE(regexp_replace(UNNEST(xpath('/agencyInfo/budgetedTotalAnnualPremium/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::double PRECISION 	AS budgeted_total_annual_premium 
			,REPLACE(regexp_replace(UNNEST(xpath('/agencyInfo/budgetedTotalAnnualRevenue/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::double PRECISION 	AS budgeted_total_annual_revenue 
	FROM 	xmldata 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 email 							= excluded.email 
			,taxpayer_id 					= excluded.taxpayer_id 
			,budgeted_total_annual_premium 	= excluded.budgeted_total_annual_premium 
			,budgeted_total_annual_revenue 	= excluded.budgeted_total_annual_revenue 
	WHERE 	(agency_info.email,agency_info.taxpayer_id,agency_info.budgeted_total_annual_premium,agency_info.budgeted_total_annual_revenue) 
		IS DISTINCT FROM 	(excluded.email,excluded.taxpayer_id,excluded.budgeted_total_annual_premium,excluded.budgeted_total_annual_revenue);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agency_info_upsert(int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agency_info_upsert(int, text) TO rl_benefitpoint_x;
GO 
