CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_dependent_fields_upsert (_custom_field_id int, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)

	INSERT INTO benefitpoint.custom_field (
		 custom_field_id 
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
		,dependent_trigger_id
	)
	
	SELECT 	 _custom_field_id 		AS custom_field_id 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/fieldType/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 			AS field_type
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/fieldValueType/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 	AS field_value_type
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/length/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int		AS "length"
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/label/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 				AS "label"
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/required/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool		AS required 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/active/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool		AS active 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/sortOrder/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int		AS sort_order 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/PHI/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool			AS phi 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/sagitta/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool		AS sagitta 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/sagittaCategory/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&') 	AS sagitta_category 
			,REPLACE(regexp_replace(UNNEST(xpath('/dependentFields/dependentTrigger/customFieldOptionValueID/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int 	AS dependent_trigger_id
	FROM 	xmldata
	ON CONFLICT (custom_field_id) DO UPDATE 
	SET 	 field_type                 = excluded.field_type 
			,field_value_type           = excluded.field_value_type 
			,"length"                   = excluded."length"
			,"label"                    = excluded."label"
			,required                   = excluded.required 
			,active                     = excluded.active 
			,sort_order                 = excluded.sort_order 
			,phi                        = excluded.phi 
			,sagitta                    = excluded.sagitta 
			,sagitta_category           = excluded.sagitta_category 
			,dependent_trigger_id    = excluded.dependent_trigger_id 
	WHERE 	(custom_field.field_type,custom_field.field_value_type,custom_field."length",custom_field."label",custom_field.required,custom_field.active,custom_field.sort_order,custom_field.phi,custom_field.sagitta,custom_field.sagitta_category,custom_field.dependent_trigger_id) 
		IS DISTINCT FROM 	(excluded.field_type,excluded.field_value_type,excluded."length",excluded."label",excluded.required,excluded.active,excluded.sort_order,excluded.phi,excluded.sagitta,excluded.sagitta_category,excluded.dependent_trigger_id);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_dependent_fields_upsert (int, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_dependent_fields_upsert (int, TEXT) TO rl_benefitpoint_x;
GO 
