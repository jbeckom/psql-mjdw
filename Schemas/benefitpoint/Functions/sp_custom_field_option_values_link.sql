CREATE OR REPLACE FUNCTION benefitpoint.sp_custom_field_option_values_link(cf_id int, cfov_id int)
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE 
	rc 	int;
	
BEGIN 
	rc := 0;

	INSERT INTO benefitpoint.custom_field_option_values (custom_field_id, custom_field_option_value_id)
	VALUES (cf_id, cfov_id)
	ON CONFLICT (custom_field_id, custom_field_option_value_id) DO NOTHING;

	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_custom_field_option_values_link(int, int) OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_custom_field_option_values_link TO rl_benefitpoint_x;
GO 
