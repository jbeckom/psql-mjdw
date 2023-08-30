CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages (
		 sagitem 
		,new_audit_staff_cd 
		,new_audit_entry_dt 
		,new_audit_time 
		,new_audit_cd 
		,new_audit_history_record_number 
		,new_audit_program 
		,new_audit_effective_dt 
		,new_audit_change_agency_id 
		,new_policy_agency_id 
		,new_location_number 
		,new_location_desc 
		,new_off_dt 
		,new_location_lower_level_coverage_slice 
		,new_lis_count_location_specific_coverage_info 
		,new_lis_count_extension_excl_optional_info 
		,new_lis_count_time_element_info 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.audit_staff_cd 
			,NEW.audit_entry_dt 
			,NEW.audit_time 
			,NEW.audit_cd 
			,NEW.audit_history_record_number 
			,NEW.audit_program 
			,NEW.audit_effective_dt 
			,NEW.audit_change_agency_id 
			,NEW.policy_agency_id 
			,NEW.location_number 
			,NEW.location_desc 
			,NEW.off_dt 
			,NEW.location_lower_level_coverage_slice 
			,NEW.lis_count_location_specific_coverage_info 
			,NEW.lis_count_extension_excl_optional_info 
			,NEW.lis_count_time_element_info 
			,'I' ;
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_i() TO rl_sagitta_x;
GO
