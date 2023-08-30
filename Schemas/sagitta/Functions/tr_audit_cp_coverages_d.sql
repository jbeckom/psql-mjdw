CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages (
		 sagitem 
		,old_audit_staff_cd 
		,old_audit_entry_dt 
		,old_audit_time 
		,old_audit_cd 
		,old_audit_history_record_number 
		,old_audit_program 
		,old_audit_effective_dt 
		,old_audit_change_agency_id 
		,old_policy_agency_id 
		,old_location_number 
		,old_location_desc 
		,old_off_dt 
		,old_location_lower_level_coverage_slice 
		,old_lis_count_location_specific_coverage_info 
		,old_lis_count_extension_excl_optional_info 
		,old_lis_count_time_element_info 
		,audit_action 
	)
	SELECT 	 OLD.sagitem 
			,OLD.audit_staff_cd 
			,OLD.audit_entry_dt 
			,OLD.audit_time 
			,OLD.audit_cd 
			,OLD.audit_history_record_number 
			,OLD.audit_program 
			,OLD.audit_effective_dt 
			,OLD.audit_change_agency_id 
			,OLD.policy_agency_id 
			,OLD.location_number 
			,OLD.location_desc 
			,OLD.off_dt 
			,OLD.location_lower_level_coverage_slice 
			,OLD.lis_count_location_specific_coverage_info 
			,OLD.lis_count_extension_excl_optional_info 
			,NEW.lis_count_time_element_info 
			,'D' ;
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_d() TO rl_sagitta_x;
GO 
