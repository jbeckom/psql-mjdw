CREATE OR REPLACE FUNCTION sagitta.sp_cp_coverages_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_coverages (
		 sagitem 
		,audit_staff_cd 
		,audit_entry_dt 
		,audit_time 
		,audit_cd 
		,audit_history_record_number 
		,audit_program 
		,audit_effective_dt 
		,audit_change_agency_id 
		,policy_agency_id 
		,location_number 
		,location_desc 
		,off_dt 
		,location_lower_level_coverage_slice 
		,lis_count_location_specific_coverage_info 
		,lis_count_extension_excl_optional_info 
		,lis_count_time_element_info 
	)
	SELECT 	 sagitem 
			,audit_staff_cd 
			,audit_entry_dt 
			,audit_time 
			,audit_cd 
			,audit_history_record_number 
			,audit_program 
			,audit_effective_dt 
			,audit_change_agency_id 
			,policy_agency_id 
			,location_number 
			,location_desc 
			,off_dt 
			,location_lower_level_coverage_slice 
			,lis_count_location_specific_coverage_info 
			,lis_count_extension_excl_optional_info 
			,lis_count_time_element_info
	FROM 	sagitta.stg_cp_coverages
	ON CONFLICT (sagitem) DO UPDATE 
	SET 	 audit_staff_cd 							= excluded.audit_staff_cd 
			,audit_entry_dt 							= excluded.audit_entry_dt 
			,audit_time 								= excluded.audit_time 
			,audit_cd 									= excluded.audit_cd 
			,audit_history_record_number 				= excluded.audit_history_record_number 
			,audit_program 								= excluded.audit_program 
			,audit_effective_dt 						= excluded.audit_effective_dt 
			,audit_change_agency_id 					= excluded.audit_change_agency_id 
			,policy_agency_id 							= excluded.policy_agency_id 
			,location_number 							= excluded.location_number 
			,location_desc 								= excluded.location_desc 
			,off_dt 									= excluded.off_dt 
			,location_lower_level_coverage_slice 		= excluded.location_lower_level_coverage_slice 
			,lis_count_location_specific_coverage_info 	= excluded.lis_count_location_specific_coverage_info 
			,lis_count_extension_excl_optional_info 	= excluded.lis_count_extension_excl_optional_info 
			,lis_count_time_element_info 				= excluded.lis_count_time_element_info 
	WHERE 	(cp_coverages.audit_staff_cd,cp_coverages.audit_entry_dt,cp_coverages.audit_time,cp_coverages.audit_cd,cp_coverages.audit_history_record_number,cp_coverages.audit_program,cp_coverages.audit_effective_dt,cp_coverages.audit_change_agency_id,cp_coverages.policy_agency_id,cp_coverages.location_number,cp_coverages.location_desc,cp_coverages.off_dt,cp_coverages.location_lower_level_coverage_slice,cp_coverages.lis_count_location_specific_coverage_info,cp_coverages.lis_count_extension_excl_optional_info,cp_coverages.lis_count_time_element_info) 
		IS DISTINCT FROM 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.location_number,excluded.location_desc,excluded.off_dt,excluded.location_lower_level_coverage_slice,excluded.lis_count_location_specific_coverage_info,excluded.lis_count_extension_excl_optional_info,excluded.lis_count_time_element_info); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_coverages_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_coverages_upsert() TO rl_sagitta_x;
GO 
