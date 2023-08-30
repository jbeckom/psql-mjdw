CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int; 

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_field (
		 custom_section 
		,custom_field_id 
		,field_type 
		,field_value_type 
		,"length" 
		,"label" 
		,required 
		,active 
		,sort_order 
		,phi 
		,sagitta 
		,sagitta_category 
		,dependent_field_parent_id 
	)
	SELECT 	 customsection
			,customfieldid::int 
			,fieldtype
			,fieldvaluetype
			,"length"::int 
			,"label" 
			,required::bool 
			,active::bool 
			,sortorder::int 
			,phi::bool 
			,sagitta::bool 
			,sagittacategory
			,dependentfieldparentid::int
	FROM 	benefitpoint.stg_custom_field 
	ON CONFLICT (custom_field_id) DO UPDATE 
	SET 	 custom_section 			= excluded.custom_section 
			,field_type 				= excluded.field_type 
			,field_value_type 			= excluded.field_value_type 
			,"length" 					= excluded."length"
			,"label" 					= excluded."label" 
			,required 					= excluded.required 
			,active 					= excluded.active 
			,sort_order 				= excluded.sort_order 
			,phi 						= excluded.phi 
			,sagitta 					= excluded.sagitta 
			,sagitta_category 			= excluded.sagitta_category 
			,dependent_field_parent_id 	= excluded.dependent_field_parent_id 
	WHERE 	(custom_field.custom_section,custom_field.field_type,custom_field.field_value_type,custom_field."length",custom_field."label",custom_field.required,custom_field.active,custom_field.sort_order,custom_field.phi,custom_field.sagitta,custom_field.sagitta_category,custom_field.dependent_field_parent_id) 
		IS DISTINCT FROM (excluded.custom_section,excluded.field_type,excluded.field_value_type,excluded."length",excluded."label",excluded.required,excluded.active,excluded.sort_order,excluded.phi,excluded.sagitta,excluded.sagitta_category,excluded.dependent_field_parent_id);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_upsert() TO rl_benefitpoint_x;
GO 