CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 new_custom_section
		,custom_field_id
		,new_field_type
		,new_field_value_type
		,new_length
		,new_label
		,new_required
		,new_active
		,new_sort_order
		,new_phi
		,new_sagitta
		,new_sagitta_category
		,new_dependent_trigger_id
		,audit_action
	)
	SELECT 	 NEW.custom_section
			,NEW.custom_field_id
			,NEW.field_type
			,NEW.field_value_type
			,NEW."length"
			,NEW."label"
			,NEW.required
			,NEW.active
			,NEW.sort_order
			,NEW.phi
			,NEW.sagitta
			,NEW.sagitta_category
			,NEW.dependent_trigger_id
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_i() TO rl_benefitpoint_x;
GO 
