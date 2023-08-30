CREATE OR REPLACE FUNCTION benefitpoint.sp_agency_account_info_upsert (_account_id int, _xmldata text) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.agency_account_info (
		 account_id
		,agency_name
	)
	
	SELECT 	 _account_id 	AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/agencyAccountInfo/agencyName/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 	AS agency_name 
	FROM 	xmldata 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	agency_name 	= excluded.agency_name 
	WHERE 	(agency_account_info.agency_name)
		IS DISTINCT FROM 	(excluded.agency_name);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agency_account_info_upsert (int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agency_account_info_upsert (int, text) TO rl_benefitpoint_x;
GO 
