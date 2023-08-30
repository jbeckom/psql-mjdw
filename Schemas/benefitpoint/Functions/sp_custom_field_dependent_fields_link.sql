CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_dependent_fields_link (cf_id int, cfdf_id int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_field_dependent_fields (custom_field_id, custom_field_dependent_field_id)
	VALUES (cf_id, cfdf_id)
	ON CONFLICT (custom_field_id, custom_field_dependent_field_id) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_dependent_fields_link (int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_dependent_fields_link TO rl_benefitpoint_x;
GO 
