CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 old_custom_section
		,new_custom_section
		,custom_field_id
		,old_field_type
		,new_field_type
		,old_field_value_type
		,new_field_value_type
		,old_length
		,new_length
		,old_label
		,new_label
		,old_required
		,new_required
		,old_active
		,new_active
		,old_sort_order
		,new_sort_order
		,old_phi
		,new_phi
		,old_sagitta
		,new_sagitta
		,old_sagitta_category
		,new_sagitta_category
		,old_dependent_trigger_id
		,new_dependent_trigger_id
		,audit_action
	)
	SELECT 	 OLD.custom_section
			,NEW.custom_section
			,OLD.custom_field_id
			,OLD.field_type
			,NEW.field_type
			,OLD.field_value_type
			,NEW.field_value_type
			,OLD."length"
			,NEW."length"
			,OLD."label"
			,NEW."label"
			,OLD.required
			,NEW.required
			,OLD.active
			,NEW.active
			,OLD.sort_order
			,NEW.sort_order
			,OLD.phi
			,NEW.phi
			,OLD.sagitta
			,NEW.sagitta
			,OLD.sagitta_category
			,NEW.sagitta_category
			,OLD.dependent_trigger_id
			,NEW.dependent_trigger_id
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_u() TO rl_benefitpoint_x;
GO 
