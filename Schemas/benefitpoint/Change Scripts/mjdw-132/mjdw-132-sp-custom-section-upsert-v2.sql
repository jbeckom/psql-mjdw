CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_section_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_section (
		 "label"
		,sort_order 
		,active 
		,customization_area
		,account_customization_categories 
	)
	SELECT DISTINCT 
 			 "label"
			,sortorder::int
			,active::bool
			,customizationarea 
			,accountcustomizationcategories 
	FROM 	benefitpoint.stg_custom_section
	ON CONFLICT (customization_area, "label") DO UPDATE 
	SET 	 sort_order = excluded.sort_order 
			,active 	= excluded.active 
			,account_customization_categories 	= excluded.account_customization_categories
	WHERE 	(custom_section.sort_order, custom_section.active, custom_section.account_customization_categories)
		IS DISTINCT FROM (excluded.sort_order, excluded.active, excluded.account_customization_categories);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_section_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_section_upsert() TO rl_benefitpoint_x;
GO 
