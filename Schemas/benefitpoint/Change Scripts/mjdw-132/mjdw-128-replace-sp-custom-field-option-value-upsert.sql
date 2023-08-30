CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_option_value_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_field_option_value (
		 custom_field_id 
		,custom_field_option_value_id 
		,description 
		,active 
		,sort_order 
		,default_option_value 
		,code 
		,dependent_trigger 
	)
	SELECT 	 customfieldid::int 
			,customfieldoptionvalueid::int 
			,description 
			,active::bool 
			,sortorder::int 
			,defaultoptionvalue::bool 
			,code 
			,dependenttrigger 
	FROM 	benefitpoint.stg_custom_field_option_value 
	ON CONFLICT (custom_field_option_value_id) DO UPDATE 
	SET 	 custom_field_id 	= excluded.custom_field_id 
			,description 		= excluded.description 
			,active 			= excluded.active 
			,sort_order 		= excluded.sort_order 
			,default_option_value 	= excluded.default_option_value 
			,code 					= excluded.code 
			,dependent_trigger 		= excluded.dependent_trigger 
	WHERE 	(custom_field_option_value.custom_field_id,custom_field_option_value.description,custom_field_option_value.active,custom_field_option_value.sort_order,custom_field_option_value.default_option_value,custom_field_option_value.code,custom_field_option_value.dependent_trigger) 
		IS DISTINCT FROM (excluded.custom_field_id,excluded.description,excluded.active,excluded.sort_order,excluded.default_option_value,excluded.code,excluded.dependent_trigger);

	GET DIAGNOSTICS rc = row_count;
	
	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_option_value_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_option_value_upsert() TO rl_benefitpoint_x;
GO 
