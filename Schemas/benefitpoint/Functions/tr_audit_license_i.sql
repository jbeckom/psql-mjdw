CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_license_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_license (
		 license_source 
		,source_key 
		,license_id 
		,new_state 
		,new_license_number 
		,new_residence_license 
		,new_license_on 
		,new_license_expires_on 
		,new_e_and_o_expires_on 
		,audit_action
	)
	SELECT 	 new.license_source 
			,new.source_key 
			,new.license_id 
			,new.state 
			,new.license_number 
			,new.residence_license 
			,new.license_on 
			,new.license_expires_on 
			,NEW.e_and_o_expires_on 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_license_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_license_i() TO rl_benefitpoint_x;
GO 
