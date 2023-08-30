CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_license_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_license (
		 license_source 
		,source_key 
		,license_id 
		,old_state 
		,new_state 
		,old_license_number 
		,new_license_number 
		,old_residence_license 
		,new_residence_license 
		,old_license_on 
		,new_license_on 
		,old_license_expires_on 
		,new_license_expires_on 
		,old_e_and_o_expires_on 
		,new_e_and_o_expires_on 
		,audit_action 
	)
	SELECT 	 new.license_source 
			,new.source_key 
			,new.license_id 
			,old.state 
			,new.state 
			,old.license_number 
			,new.license_number 
			,old.residence_license 
			,new.residence_license 
			,old.license_on 
			,new.license_on 
			,old.license_expires_on 
			,new.license_expires_on 
			,old.e_and_o_expires_on 
			,new.e_and_o_expires_on 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_license_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_license_u() TO rl_benefitpoint_x;
GO 
