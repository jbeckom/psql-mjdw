CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_value_upsert (_cfv_source TEXT, _source_key int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.custom_field_value (
		 custom_field_value_id 
		,custom_field_id 
		,option_value_id 
		,value_text 
		,cfv_source 
		,source_key 
	)
	
	SELECT 	 REPLACE(regexp_replace(UNNEST(xpath('/CustomFieldValues/customFieldValueID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 	AS custom_field_value_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/CustomFieldValues/customFieldID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 			AS custom_field_id
			,REPLACE(regexp_replace(UNNEST(xpath('/CustomFieldValues/optionValueID/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&')::int 			AS option_value_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/CustomFieldValues/valueText/text()',exemel))::TEXT,'\r|\n|\t','','g'),'&amp;','&') 					AS custom_field_value_id
			,_cfv_source 	AS cfv_source
			,_source_key 	AS source_key 
	FROM 	xmldata
	ON CONFLICT (cfv_source, source_key, custom_field_id) DO UPDATE 
	SET 	 custom_field_value_id 	= excluded.custom_field_value_id 
			,option_value_id 		= excluded.option_value_id 
			,value_text 			= excluded.value_text 
	WHERE 	(custom_field_value.custom_field_value_id, custom_field_value.option_value_id, custom_field_value.value_text) 
		IS DISTINCT FROM (excluded.custom_field_value_id, excluded.option_value_id, excluded.value_text);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_value_upsert(TEXT, int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_value_upsert(TEXT, int, TEXT) TO rl_benefitpoint_x;
GO 
