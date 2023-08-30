CREATE OR REPLACE FUNCTION benefitpoint.sp_account_location_upsert (_account_id int, _location_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE
	rc 	int;
	
BEGIN 
	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.account_location (
		 account_id 
		,location_id 
		,code 
		,name 
		,payroll_cycle 
	)
	
	SELECT 	 _account_id 	AS account_id 
			,_location_id 	AS location_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/accountLocations/code/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS code 
			,REPLACE(regexp_replace(UNNEST(xpath('/accountLocations/name/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS name 
			,REPLACE(regexp_replace(UNNEST(xpath('/accountLocations/payrollCycle/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 	AS payroll_cycle 
	FROM 	xmldata 
	ON CONFLICT (account_id, location_id) DO UPDATE 
	SET 	 code 			= excluded.code 
			,name 			= excluded.name 
			,payroll_cycle 	= excluded.payroll_cycle
	WHERE 	(account_location.code, account_location.name, account_location.payroll_cycle)
		IS DISTINCT FROM 	(excluded.code, excluded.name, excluded.payroll_cycle);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_location_upsert(int, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_location_upsert(int, int, TEXT) TO rl_benefitpoint_x;
GO 
