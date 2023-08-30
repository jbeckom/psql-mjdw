CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_section_account_customization_categories_link(cs_label TEXT, act_value TEXT)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_section_account_customization_categories (custom_section, account_classification_type)
	VALUES (cs_label, act_value)
	ON CONFLICT (custom_section, account_classification_type) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_section_account_customization_categories_link(TEXT, TEXT) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_section_account_customization_categories_link(TEXT, TEXT) TO rl_benefitpoint_x;
GO 
