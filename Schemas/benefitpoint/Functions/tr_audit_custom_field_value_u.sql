CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_value_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_value (
		 old_custom_field_value_id 
		,new_custom_field_value_id
		,custom_field_id 
		,old_option_value_id 
		,new_option_value_id 
		,old_value_text 
		,new_value_text 
		,cfv_source  
		,source_key  
		,audit_action 
	)
	SELECT 	 OLD.custom_field_value_id 
			,NEW.custom_field_value_id 
			,OLD.custom_field_id 
			,OLD.option_value_id 
			,NEW.option_value_id 
			,OLD.value_text 
			,NEW.value_text 
			,OLD.cfv_source 
			,OLD.source_key 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_value_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_value_u() TO rl_benefitpoint_x;
GO 
