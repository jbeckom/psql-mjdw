CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_option_value_i()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_option_value (
		 cfov_source 
		,source_key 
		,custom_field_option_value_id
		,new_description
		,new_active
		,new_sort_order
		,new_default_option_value
		,new_code
		,audit_action
	)
	SELECT 	 NEW.cfov_source
			,NEW.source_key 
			,NEW.custom_field_option_value_id
			,NEW.description
			,NEW.active
			,NEW.sort_order
			,NEW.default_option_value
			,NEW.code
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_option_value_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_option_value_i() TO rl_benefitpoint_x;
GO 
