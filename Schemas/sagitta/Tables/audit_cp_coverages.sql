CREATE TABLE sagitta.audit_cp_coverages (
	 sagitem 											TEXT 		NOT NULL 
	,old_audit_staff_cd 								TEXT 		NULL 
	,new_audit_staff_cd 								TEXT 		NULL 
	,old_audit_entry_dt 								int 		NULL 
	,new_audit_entry_dt 								int 		NULL 
	,old_audit_time 									int 		NULL 
	,new_audit_time 									int 		NULL 
	,old_audit_cd 										TEXT 		NULL 
	,new_audit_cd 										TEXT 		NULL 
	,old_audit_history_record_number 					TEXT 		NULL 
	,new_audit_history_record_number 					TEXT 		NULL 
	,old_audit_program 									TEXT 		NULL 
	,new_audit_program 									TEXT 		NULL 
	,old_audit_effective_dt 							TEXT 		NULL 
	,new_audit_effective_dt 							TEXT 		NULL 
	,old_audit_change_agency_id 						TEXT 		NULL 
	,new_audit_change_agency_id 						TEXT 		NULL 
	,old_policy_agency_id 								TEXT 		NULL 
	,new_policy_agency_id 								TEXT 		NULL 
	,old_location_number 								TEXT 		NULL 
	,new_location_number 								TEXT 		NULL 
	,old_location_desc 									TEXT 		NULL 
	,new_location_desc 									TEXT 		NULL 
	,old_off_dt 										TEXT 		NULL 
	,new_off_dt 										TEXT 		NULL 
	,old_location_lower_level_coverage_slice 			TEXT 		NULL 
	,new_location_lower_level_coverage_slice 			TEXT 		NULL 
	,old_lis_count_location_specific_coverage_info 		TEXT 		NULL 
	,new_lis_count_location_specific_coverage_info 		TEXT 		NULL 
	,old_lis_count_extension_excl_optional_info 		TEXT 		NULL 
	,new_lis_count_extension_excl_optional_info 		TEXT 		NULL 
	,old_lis_count_time_element_info 					TEXT 		NULL 
	,new_lis_count_time_element_info 					TEXT 		NULL 
	,audit_action 										char(1) 	NOT NULL 
	,audit_user 										TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 									timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 											bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_coverages OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_coverages TO rl_sagitta_a;
GO 
