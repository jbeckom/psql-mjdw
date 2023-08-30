CREATE OR REPLACE FUNCTION benefitpoint.sp_phone_insert (_phone_source TEXT, _source_type TEXT, _source_key int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.phone (
		 phone_source 
		,source_type 
		,source_key 
		,area_code 
		,phone_number 
		,phone_type 
	)
	
	SELECT 	 _phone_source 	AS phone_source 
			,_source_type 	AS source_type 
			,_source_key 	AS source_key 
			,REPLACE(regexp_replace(UNNEST(xpath('/phone/areaCode/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 						AS area_code 
			,REPLACE(regexp_replace(UNNEST(xpath('/phone/number/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 							AS phone_number 
			,REPLACE(regexp_replace(UNNEST(xpath('/phone/type/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::benefitpoint.phone_type 	AS phone_type 
	FROM 	xmldata;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_phone_insert(TEXT, TEXT, int, text) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_phone_insert(TEXT, TEXT, int, text) TO rl_benefitpoint_x;
GO 
