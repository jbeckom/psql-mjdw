CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_person_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_person_info (
		 person_source 
		,source_type 
		,source_key 
		,old_first_name
		,new_first_name
		,old_middle_name
		,new_middle_name
		,old_last_name
		,new_last_name
		,old_salutation
		,new_salutation
		,old_date_of_birth
		,new_date_of_birth
		,old_gender
		,new_gender
		,old_ssn
		,new_ssn
		,old_marital_status
		,new_marital_status
		,audit_action
	)
	SELECT 	 OLD.person_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.first_name
			,NEW.first_name
			,OLD.middle_name
			,NEW.middle_name
			,OLD.last_name
			,NEW.last_name
			,OLD.salutation
			,NEW.salutation
			,OLD.date_of_birth
			,NEW.date_of_birth
			,OLD.gender
			,NEW.gender
			,OLD.ssn
			,NEW.ssn
			,OLD.marital_status
			,NEW.marital_status 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_person_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_person_info_u() TO rl_benefitpoint_x;
GO 
