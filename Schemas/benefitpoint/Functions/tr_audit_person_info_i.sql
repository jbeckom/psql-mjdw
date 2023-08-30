CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_person_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_person_info (
		 person_source 
		,source_type 
		,source_key 
		,new_first_name
		,new_middle_name
		,new_last_name
		,new_salutation
		,new_date_of_birth
		,new_gender
		,new_ssn
		,new_marital_status
		,audit_action
	)
	SELECT 	 NEW.person_source 
			,NEW.source_type 
			,NEW.source_key 
			,NEW.first_name
			,NEW.middle_name
			,NEW.last_name
			,NEW.salutation
			,NEW.date_of_birth
			,NEW.gender
			,NEW.ssn
			,NEW.marital_status 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_person_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_person_info_i() TO rl_benefitpoint_x;
GO 
