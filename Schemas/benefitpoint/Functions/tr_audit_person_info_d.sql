CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_person_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_person_info (
		 person_source 
		,source_type 
		,source_key 
		,old_first_name
		,old_middle_name
		,old_last_name
		,old_salutation
		,old_date_of_birth
		,old_gender
		,old_ssn
		,old_marital_status
		,audit_action
	)
	SELECT 	 OLD.person_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.first_name
			,OLD.middle_name
			,OLD.last_name
			,OLD.salutation
			,OLD.date_of_birth
			,OLD.gender
			,OLD.ssn
			,OLD.marital_status 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_person_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_person_info_d() TO rl_benefitpoint_x;
GO 
