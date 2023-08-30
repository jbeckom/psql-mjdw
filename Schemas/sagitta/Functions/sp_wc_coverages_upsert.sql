create or replace function sagitta.sp_wc_coverages_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into sagitta.wc_coverages (
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
		,empl_liab_acc_limit
		,disease_per_empl_limit
		,disease_policy_limit
		,empl_liab_premium_amt
		,uslh_ind
		,uslh_premium_amt
		,voluntary_comp_ind
		,voluntary_comp_premium_amt
		,other_states_ind
		,other_states_premium_amt
		,excluded_states
		,included_states
		,off_dt
		,rate
		,statutory_limits_apply
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
			,empl_liab_acc_limit
			,disease_per_empl_limit
			,disease_policy_limit
			,empl_liab_premium_amt
			,uslh_ind
			,uslh_premium_amt
			,voluntary_comp_ind
			,voluntary_comp_premium_amt
			,other_states_ind
			,other_states_premium_amt
			,excluded_states
			,included_states
			,off_dt
			,rate
			,statutory_limits_apply
	from 	sagitta.stg_wc_coverages 
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
			,empl_liab_acc_limit 			= excluded.empl_liab_acc_limit
			,disease_per_empl_limit 		= excluded.disease_per_empl_limit
			,disease_policy_limit 			= excluded.disease_policy_limit
			,empl_liab_premium_amt 			= excluded.empl_liab_premium_amt
			,uslh_ind 						= excluded.uslh_ind
			,uslh_premium_amt 				= excluded.uslh_premium_amt
			,voluntary_comp_ind 			= excluded.voluntary_comp_ind
			,voluntary_comp_premium_amt 	= excluded.voluntary_comp_premium_amt
			,other_states_ind 				= excluded.other_states_ind
			,other_states_premium_amt 		= excluded.other_states_premium_amt
			,excluded_states 				= excluded.excluded_states
			,included_states 				= excluded.included_states
			,off_dt 						= excluded.off_dt
			,rate 							= excluded.rate
			,statutory_limits_apply 		= excluded.statutory_limits_apply
	where 	(wc_coverages.audit_staff_cd,wc_coverages.audit_entry_dt,wc_coverages.audit_time,wc_coverages.audit_cd,wc_coverages.audit_history_record_number,wc_coverages.audit_program,wc_coverages.audit_effective_dt,wc_coverages.audit_change_agency_id,wc_coverages.policy_agency_id,wc_coverages.empl_liab_acc_limit,wc_coverages.disease_per_empl_limit,wc_coverages.disease_policy_limit,wc_coverages.empl_liab_premium_amt,wc_coverages.uslh_ind,wc_coverages.uslh_premium_amt,wc_coverages.voluntary_comp_ind,wc_coverages.voluntary_comp_premium_amt,wc_coverages.other_states_ind,wc_coverages.other_states_premium_amt,wc_coverages.excluded_states,wc_coverages.included_states,wc_coverages.off_dt,wc_coverages.rate,wc_coverages.statutory_limits_apply) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.empl_liab_acc_limit,excluded.disease_per_empl_limit,excluded.disease_policy_limit,excluded.empl_liab_premium_amt,excluded.uslh_ind,excluded.uslh_premium_amt,excluded.voluntary_comp_ind,excluded.voluntary_comp_premium_amt,excluded.other_states_ind,excluded.other_states_premium_amt,excluded.excluded_states,excluded.included_states,excluded.off_dt,excluded.rate,excluded.statutory_limits_apply); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_wc_coverages_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_wc_coverages_upsert() to rl_sagitta_x;
go 
