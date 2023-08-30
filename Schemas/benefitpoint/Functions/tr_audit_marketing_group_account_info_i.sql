CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_marketing_group_account_info (
		 account_id
		,new_marketing_group_name 
		,new_marketing_group_type 
		,new_number_of_ftes 
		,new_number_of_ftes_as_of 
		,new_number_of_full_time_equivalents 
		,new_number_of_full_time_equivalents_as_of_date 
		,new_coverage_subject_to_employer_mandate 
		,audit_action 
	) 
	SELECT 	 NEW.account_id
			,NEW.marketing_group_name 
			,NEW.marketing_group_type 
			,NEW.number_of_ftes 
			,NEW.number_of_ftes_as_of 
			,NEW.number_of_full_time_equivalents 
			,NEW.number_of_full_time_equivalents_as_of_date 
			,NEW.coverage_subject_to_employer_mandate 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_marketing_group_account_info_i() TO rl_benefitpoint_x;
GO 
