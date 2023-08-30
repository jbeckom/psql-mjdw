CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_marketing_group_account_info (
		 account_id 
		,old_marketing_group_name 
		,old_marketing_group_type 
		,old_number_of_ftes 
		,old_number_of_ftes_as_of 
		,old_number_of_full_time_equivalents 
		,old_number_of_full_time_equivalents_as_of_date 
		,old_coverage_subject_to_employer_mandate 
		,audit_action 
	) 
	SELECT 	 OLD.account_id
			,OLD.marketing_group_name 
			,OLD.marketing_group_type 
			,OLD.number_of_ftes 
			,OLD.number_of_ftes_as_of 
			,OLD.number_of_full_time_equivalents 
			,OLD.number_of_full_time_equivalents_as_of_date 
			,OLD.coverage_subject_to_employer_mandate 
			,'D';
	RETURN OLD;
END;
$$;

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_marketing_group_account_info_d() TO rl_benefitpoint_x;
GO 
