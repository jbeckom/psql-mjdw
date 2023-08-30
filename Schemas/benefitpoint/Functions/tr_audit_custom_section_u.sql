CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section (
		 old_customization_area 
		,new_customization_area 
		,"label"
		,old_sort_order
		,new_sort_order
		,old_active
		,new_active
		,audit_action
	)
	SELECT 	 OLD.customization_area
			,NEW.customization_area
			,OLD."label"
			,OLD.sort_order
			,NEW.sort_order
			,OLD.active
			,NEW.active
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_section_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_section_u() TO rl_benefitpoint_x;
GO 