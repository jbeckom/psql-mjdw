CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_u()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source
		,source_key 
		,custom_field_option_value_id
		,old_description
		,new_description
		,old_active
		,new_active
		,old_sort_order
		,new_sort_order
		,old_default_option_value
		,new_default_option_value
		,old_code
		,new_code
		,audit_action
	)
	SELECT 	 OLD.cfov_source
			,OLD.source_key
			,OLD.custom_field_option_value_id
			,OLD.description
			,NEW.description
			,OLD.active
			,NEW.active
			,OLD.sort_order
			,NEW.sort_order
			,OLD.default_option_value
			,NEW.default_option_value
			,OLD.code
			,NEW.code
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_u() TO rl_benefitpoint_x;
GO 
