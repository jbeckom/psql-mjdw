create or replace function sagitta.sp_gs_coverages_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.gs_coverages (
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
		,glass_deductible
		,glass_retention_pct
		,large_glass_option_ind
		,sign_full_form_coverage_ind
		,sign_deductible_clause_ind
		,off_dt
		,lis_count_glass_info
		,lis_count_sign_item_info 
	)
	select 	 sagitem 
			,audit_staff_cd
			,audit_entry_dt
			,audit_time
			,audit_cd
			,audit_history_record_number
			,audit_program
			,audit_effective_dt
			,audit_change_agency_id
			,policy_agency_id
			,glass_deductible
			,glass_retention_pct
			,large_glass_option_ind
			,sign_full_form_coverage_ind
			,sign_deductible_clause_ind
			,off_dt
			,lis_count_glass_info
			,lis_count_sign_item_info 
	from 	sagitta.stg_gs_coverages 
	on conflict (sagitem) do update 
	set 	 audit_staff_cd 				= excluded.audit_staff_cd
			,audit_entry_dt 				= excluded.audit_entry_dt
			,audit_time 					= excluded.audit_time
			,audit_cd 						= excluded.audit_cd
			,audit_history_record_number 	= excluded.audit_history_record_number
			,audit_program 					= excluded.audit_program
			,audit_effective_dt 			= excluded.audit_effective_dt
			,audit_change_agency_id 		= excluded.audit_change_agency_id
			,policy_agency_id 				= excluded.policy_agency_id
			,glass_deductible 				= excluded.glass_deductible
			,glass_retention_pct 			= excluded.glass_retention_pct
			,large_glass_option_ind 		= excluded.large_glass_option_ind
			,sign_full_form_coverage_ind 	= excluded.sign_full_form_coverage_ind
			,sign_deductible_clause_ind 	= excluded.sign_deductible_clause_ind
			,off_dt 						= excluded.off_dt
			,lis_count_glass_info 			= excluded.lis_count_glass_info
			,lis_count_sign_item_info 		= excluded.lis_count_sign_item_info
	where 	(gs_coverages.audit_staff_cd,gs_coverages.audit_entry_dt,gs_coverages.audit_time,gs_coverages.audit_cd,gs_coverages.audit_history_record_number,gs_coverages.audit_program,gs_coverages.audit_effective_dt,gs_coverages.audit_change_agency_id,gs_coverages.policy_agency_id,gs_coverages.glass_deductible,gs_coverages.glass_retention_pct,gs_coverages.large_glass_option_ind,gs_coverages.sign_full_form_coverage_ind,gs_coverages.sign_deductible_clause_ind,gs_coverages.off_dt,gs_coverages.lis_count_glass_info,gs_coverages.lis_count_sign_item_info) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.glass_deductible,excluded.glass_retention_pct,excluded.large_glass_option_ind,excluded.sign_full_form_coverage_ind,excluded.sign_deductible_clause_ind,excluded.off_dt,excluded.lis_count_glass_info,excluded.lis_count_sign_item_info); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gs_coverages_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gs_coverages_upsert() to rl_sagitta_x;
go 
