CREATE OR REPLACE FUNCTION benefitpoint.sp_individual_account_info_upsert (_account_id int, _xmldata text) 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;
	
	WITH xmldata AS (SELECT _xmldata::XML AS exemel) 
	
	INSERT INTO benefitpoint.individual_account_info (
		 account_id 
		,email 
		,affiliated_group_account_id 
	)
	
	SELECT 	 _account_id 			AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/individualAccountInfo/email/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 							AS email 
			,REPLACE(regexp_replace(UNNEST(xpath('/individualAccountInfo/affiliatedGroupAccountID/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int 	AS affiliated_group_account_id 
	FROM 	xmldata 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 email 							= excluded.email 
			,affiliated_group_account_id 	= excluded.affiliated_group_account_id 
	WHERE 	(individual_account_info.email, individual_account_info.affiliated_group_account_id) 
		IS DISTINCT FROM 	(excluded.email, excluded.affiliated_group_account_id);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_individual_account_info_upsert(int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_individual_account_info_upsert(int, text) TO rl_benefitpoint_x;
GO 
