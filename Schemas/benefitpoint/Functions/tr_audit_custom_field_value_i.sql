CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_value_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_value (
		 new_custom_field_value_id 
		,custom_field_id 
		,new_option_value_id 
		,new_value_text 
		,cfv_source 
		,source_key 
		,audit_action 
	)
	SELECT 	 NEW.custom_field_value_id
			,NEW.custom_field_id 
			,NEW.option_value_id 
			,NEW.value_text 
			,NEW.cfv_source 
			,NEW.source_key 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_value_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_value_i() TO rl_benefitpoint_x;
GO 
