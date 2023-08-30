CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_phone_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_phone (
		 phone_source 
		,source_type 
		,source_key 
		,old_area_code 
		,old_phone_number 
		,old_phone_type 
		,audit_action
	)
	SELECT 	 OLD.phone_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.area_code 
			,OLD.phone_number 
			,OLD.phone_type 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_phone_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_phone_d() TO rl_benefitpoint_x;
GO 
