CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section (
		 new_customization_area
		,"label"
		,new_sort_order
		,new_active
		,audit_action
	)
	SELECT 	 NEW.customization_area
			,NEW."label"
			,NEW.sort_order
			,NEW.active
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_section_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_section_i() TO rl_benefitpoint_x;
GO 
