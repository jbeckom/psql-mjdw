CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_d()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source
		,source_key
		,custom_field_option_value_id
		,old_description
		,old_active
		,old_sort_order
		,old_default_option_value
		,old_code
		,audit_action
	)
	SELECT 	 OLD.cfov_source
			,OLD.source_key
			,OLD.custom_field_option_value_id
			,OLD.description
			,OLD.active
			,OLD.sort_order
			,OLD.default_option_value
			,OLD.code
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_d() TO rl_benefitpoint_x;
GO 
