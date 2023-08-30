CREATE OR REPLACE FUNCTION benefitpoint.sp_agent_account_info_upsert (_account_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.agent_account_info (
		 account_id
		,agency_account_id 
	)
	
	SELECT 	 _account_id 	AS account_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/agentAccountInfo/agencyAccountID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS agency_account_id 
	FROM 	xmldata 
	ON CONFLICT (account_id) 	DO UPDATE 
	SET 	agency_account_id 	= excluded.agency_account_id 
	WHERE 	(agent_account_info.agency_account_id)
		IS DISTINCT FROM 	(excluded.agency_account_id);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_agent_account_info_upsert(int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_agent_account_info_upsert(int, TEXT) TO rl_benefitpoint_x;
GO 
