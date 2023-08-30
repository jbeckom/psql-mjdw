CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_license_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_license (
		 license_source 
		,source_key 
		,license_id 
		,old_state 
		,old_license_number 
		,old_residence_license 
		,old_license_on 
		,old_license_expires_on 
		,old_e_and_o_expires_on 
		,audit_action
	)
	SELECT 	 OLD.license_source 
			,OLD.source_key 
			,OLD.license_id 
			,OLD.state 
			,OLD.license_number 
			,OLD.residence_license 
			,OLD.license_on 
			,OLD.license_expires_on 
			,OLD.e_and_o_expires_on 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_license_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_license_d() TO rl_benefitpoint_x;
GO 
