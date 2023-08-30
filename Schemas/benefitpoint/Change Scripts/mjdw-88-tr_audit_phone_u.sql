CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,old_area_code 
		,new_area_code 
		,old_phone_number 
		,new_phone_number 
		,old_phone_type 
		,new_phone_type 
		,audit_action
	)
	SELECT 	 OLD.phone_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.area_code 
			,NEW.area_code 
			,OLD.phone_number 
			,NEW.phone_number 
			,OLD.phone_type 
			,NEW.phone_type 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_phone_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_phone_u() TO rl_benefitpoint_x;
GO 
