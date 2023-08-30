CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_dependent_trigger_upsert (_custom_field_option_value_id int, _xmldata text)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)
	
	INSERT INTO benefitpoint.custom_field_option_value (
		 custom_field_option_value_id 
		,description 
		,active 
		,sort_order 
		,default_option_value 
		,code 
	)
	
	SELECT 	 _custom_field_option_value_id 	AS custom_field_option_value_id
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentTrigger/description/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 						AS description
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentTrigger/active/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 						AS active 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentTrigger/sortOrder/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int 					AS sort_order
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentTrigger/defaultOptionValue/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 			AS default_option_value
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentTrigger/code/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 								AS code
	FROM 	xmldata
	ON CONFLICT (custom_field_option_value_id) DO UPDATE 
	SET 	 description 			= excluded.description 
			,active 				= excluded.active 
			,sort_order 			= excluded.sort_order 
			,default_option_value 	= excluded.default_option_value 
			,code 					= excluded.code 
	WHERE 	(custom_field_option_value.description,custom_field_option_value.active,custom_field_option_value.sort_order,custom_field_option_value.default_option_value,custom_field_option_value.code)
		IS DISTINCT FROM 	(excluded.description,excluded.active,excluded.sort_order,excluded.default_option_value,excluded.code);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_dependent_trigger_upsert (int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_dependent_trigger_upsert (int, TEXT) TO rl_benefitpoint_x;
GO 
