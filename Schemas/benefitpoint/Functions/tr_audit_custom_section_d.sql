CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section ( 
		 old_customization_area 
		,"label"
		,old_sort_order
		,old_active
		,audit_action
	)
	SELECT 	 OLD.customization_area
			,OLD."label"
			,OLD.sort_order
			,OLD.active
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_custom_section_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_custom_section_d() TO rl_benefitpoint_x;
GO 
