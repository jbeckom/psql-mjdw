CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_field_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_field (
		 old_custom_section
		,custom_field_id
		,old_field_type
		,old_field_value_type
		,old_length
		,old_label
		,old_required
		,old_active
		,old_sort_order
		,old_phi
		,old_sagitta
		,old_sagitta_category
		,old_dependent_trigger_id
		,audit_action
	)
	SELECT 	 OLD.custom_section
			,OLD.custom_field_id
			,OLD.field_type
			,OLD.field_value_type
			,OLD."length"
			,OLD."label"
			,OLD.required
			,OLD.active
			,OLD.sort_order
			,OLD.phi
			,OLD.sagitta
			,OLD.sagitta_category
			,OLD.dependent_trigger_id
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_field_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_field_d() TO rl_benefitpoint_x;
GO 
