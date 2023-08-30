CREATE OR REPLACE FUNCTION benefitpoint.sp_agent_info_upsert (_account_id int, _xmldata text) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;
	
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.agent_info (
		 account_id 
		,email 
		,tax_payer_id 
		,budgeted_total_annual_premium 
		,budgeted_total_annual_revenue 
	)
	
	SELECT 	 _account_id 		AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/agentInfo/email/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 											AS email 
			,REPLACE(regexp_replace(UNNEST(xpath('/agentInfo/taxPayerID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 										AS tax_payer_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/agentInfo/budgetedTotalAnnualPremium/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::double PRECISION 	AS budgeted_total_annual_premium 
			,REPLACE(regexp_replace(UNNEST(xpath('/agentInfo/budgetedTotalAnnualRevenue/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::double PRECISION 	AS budgeted_total_annual_revenue 
	FROM 	xmldata 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 email 							= excluded.email 
			,tax_payer_id 					= excluded.tax_payer_id 
			,budgeted_total_annual_premium 	= excluded.budgeted_total_annual_premium 
			,budgeted_total_annual_revenue 	= excluded.budgeted_total_annual_revenue 
	WHERE 	(agent_info.email,agent_info.tax_payer_id,agent_info.budgeted_total_annual_premium,agent_info.budgeted_total_annual_revenue) 
		IS DISTINCT FROM 	(excluded.email,excluded.tax_payer_id,excluded.budgeted_total_annual_premium,excluded.budgeted_total_annual_revenue); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agent_info_upsert (int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agent_info_upsert (int, text) TO rl_benefitpoint_x;
GO 
