CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,new_area_code 
		,new_phone_number 
		,new_phone_type 
		,audit_action
	)
	SELECT 	 NEW.phone_source 
			,NEW.source_type 
			,NEW.source_key 
			,NEW.area_code 
			,NEW.phone_number 
			,NEW.phone_type 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_phone_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_phone_i() TO rl_benefitpoint_x;
GO 
