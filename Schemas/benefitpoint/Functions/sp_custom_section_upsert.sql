CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_section_upsert (_customization_area TEXT, cs_label TEXT, _xmldata TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	WITH xmldata AS (SELECT _xmldata::XML AS exemel)

	INSERT INTO benefitpoint.custom_section (
		 customization_area
		,"label"
		,sort_order 
		,active
	)
	
	SELECT 	 _customization_area 	AS customization_area
			,cs_label 				AS "label"
			,REPLACE(regexp_replace(UNNEST(xpath('/sections/sortOrder/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::int 					AS sort_order
			,REPLACE(regexp_replace(UNNEST(xpath('/sections/active/text()', exemel))::TEXT, '\r|\n|\t','','g'),'&amp;', '&')::bool 						AS active 
	FROM 	xmldata
	ON CONFLICT ("label") DO UPDATE 
	SET 	 customization_area 				= excluded.customization_area
			,sort_order 						= excluded.sort_order
			,active 							= excluded.active
	WHERE 	(custom_section.customization_area, custom_section.sort_order, custom_section.active)
		IS DISTINCT FROM (excluded.customization_area, excluded.sort_order, excluded.active);
	
	GET DIAGNOSTICS rc = row_count;
	
	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_section_upsert (TEXT, TEXT, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_section_upsert(TEXT, TEXT, TEXT) TO rl_benefitpoint_x;
GO 
