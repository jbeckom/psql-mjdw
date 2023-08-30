create or replace function sagitta.sp_gl_coverages_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.gl_coverages (
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
		,general_liab_ind
		,claims_made_ind
		,claims_occurrence_ind
		,other_coverage_premium
		,per_claim_ind
		,per_occurrence_ind
		,ded_basis_cd
		,deductible
		,gen_aggregate
		,product_completed_ops_info
		,pers_advertising_injury
		,each_occurrence
		,fire_legal
		,medical_expense
		,premises_operation
		,products_premium_amt
		,total_premium_amt
		,off_dt
		,total_other_cov_premium_amt
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
			,general_liab_ind
			,claims_made_ind
			,claims_occurrence_ind
			,other_coverage_premium
			,per_claim_ind
			,per_occurrence_ind
			,ded_basis_cd
			,deductible
			,gen_aggregate
			,product_completed_ops_info
			,pers_advertising_injury
			,each_occurrence
			,fire_legal
			,medical_expense
			,premises_operation
			,products_premium_amt
			,total_premium_amt
			,off_dt
			,total_other_cov_premium_amt
	from 	sagitta.stg_gl_coverages 
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
			,general_liab_ind 				= excluded.general_liab_ind
			,claims_made_ind 				= excluded.claims_made_ind
			,claims_occurrence_ind 			= excluded.claims_occurrence_ind
			,other_coverage_premium 		= excluded.other_coverage_premium
			,per_claim_ind 					= excluded.per_claim_ind
			,per_occurrence_ind 			= excluded.per_occurrence_ind
			,ded_basis_cd 					= excluded.ded_basis_cd
			,deductible 					= excluded.deductible
			,gen_aggregate 					= excluded.gen_aggregate
			,product_completed_ops_info 	= excluded.product_completed_ops_info
			,pers_advertising_injury 		= excluded.pers_advertising_injury
			,each_occurrence 				= excluded.each_occurrence
			,fire_legal 					= excluded.fire_legal
			,medical_expense 				= excluded.medical_expense
			,premises_operation 			= excluded.premises_operation
			,products_premium_amt 			= excluded.products_premium_amt
			,total_premium_amt 				= excluded.total_premium_amt
			,off_dt 						= excluded.off_dt
			,total_other_cov_premium_amt 	= excluded.total_other_cov_premium_amt
	where 	(gl_coverages.audit_staff_cd,gl_coverages.audit_entry_dt,gl_coverages.audit_time,gl_coverages.audit_cd,gl_coverages.audit_history_record_number,gl_coverages.audit_program,gl_coverages.audit_effective_dt,gl_coverages.audit_change_agency_id,gl_coverages.policy_agency_id,gl_coverages.general_liab_ind,gl_coverages.claims_made_ind,gl_coverages.claims_occurrence_ind,gl_coverages.other_coverage_premium,gl_coverages.per_claim_ind,gl_coverages.per_occurrence_ind,gl_coverages.ded_basis_cd,gl_coverages.deductible,gl_coverages.gen_aggregate,gl_coverages.product_completed_ops_info,gl_coverages.pers_advertising_injury,gl_coverages.each_occurrence,gl_coverages.fire_legal,gl_coverages.medical_expense,gl_coverages.premises_operation,gl_coverages.products_premium_amt,gl_coverages.total_premium_amt,gl_coverages.off_dt,gl_coverages.total_other_cov_premium_amt) 
		is distinct from (excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.general_liab_ind,excluded.claims_made_ind,excluded.claims_occurrence_ind,excluded.other_coverage_premium,excluded.per_claim_ind,excluded.per_occurrence_ind,excluded.ded_basis_cd,excluded.deductible,excluded.gen_aggregate,excluded.product_completed_ops_info,excluded.pers_advertising_injury,excluded.each_occurrence,excluded.fire_legal,excluded.medical_expense,excluded.premises_operation,excluded.products_premium_amt,excluded.total_premium_amt,excluded.off_dt,excluded.total_other_cov_premium_amt); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gl_coverages_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gl_coverages_upsert() to rl_sagitta_x;
go 
