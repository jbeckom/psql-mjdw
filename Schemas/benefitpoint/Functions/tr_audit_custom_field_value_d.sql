CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_value_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field_value (
		 old_custom_field_value_id 
		,custom_field_id 
		,old_option_value_id 
		,old_value_text 
		,old_cfv_source 
		,old_source_key 
		,audit_action 
	)
	SELECT 	 OLD.custom_field_value_id
			,OLD.custom_field_id 
			,OLD.option_value_id 
			,OLD.value_text 
			,OLD.cfv_source 
			,OLD.source_key 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_value_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_value_d() TO rl_benefitpoint_x;
GO 
