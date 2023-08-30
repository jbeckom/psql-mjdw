create or replace function sagitta.sp_ol_coverages_upsert()
returns int 
language plpgsql 
as $$

declare rc int;

begin
	insert into sagitta.ol_coverages(
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
		,lob_cd
		,lob_desc
		,rating_basis
		,valuation_code_1
		,valuation_code_2
		,cause_of_loss
		,cov_effective_date
		,cov_expiration_date
		,number_of_1_desc
		,number_of_2
		,number_of_2_desc
		,off_dt
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
			,lob_cd
			,lob_desc
			,rating_basis
			,valuation_code_1
			,valuation_code_2
			,cause_of_loss
			,cov_effective_date
			,cov_expiration_date
			,number_of_1_desc
			,number_of_2
			,number_of_2_desc
			,off_dt
	from 	sagitta.stg_ol_coverages 
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
			,lob_cd 						= excluded.lob_cd
			,lob_desc 						= excluded.lob_desc
			,rating_basis 					= excluded.rating_basis
			,valuation_code_1 				= excluded.valuation_code_1
			,valuation_code_2 				= excluded.valuation_code_2
			,cause_of_loss 					= excluded.cause_of_loss
			,cov_effective_date 			= excluded.cov_effective_date
			,cov_expiration_date 			= excluded.cov_expiration_date
			,number_of_1_desc 				= excluded.number_of_1_desc
			,number_of_2 					= excluded.number_of_2
			,number_of_2_desc 				= excluded.number_of_2_desc
			,off_dt 						= excluded.off_dt
	where 	(ol_coverages.audit_staff_cd,ol_coverages.audit_entry_dt,ol_coverages.audit_time,ol_coverages.audit_cd,ol_coverages.audit_history_record_number,ol_coverages.audit_program,ol_coverages.audit_effective_dt,ol_coverages.audit_change_agency_id,ol_coverages.policy_agency_id,ol_coverages.lob_cd,ol_coverages.lob_desc,ol_coverages.rating_basis,ol_coverages.valuation_code_1,ol_coverages.valuation_code_2,ol_coverages.cause_of_loss,ol_coverages.cov_effective_date,ol_coverages.cov_expiration_date,ol_coverages.number_of_1_desc,ol_coverages.number_of_2,ol_coverages.number_of_2_desc,ol_coverages.off_dt) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.lob_cd,excluded.lob_desc,excluded.rating_basis,excluded.valuation_code_1,excluded.valuation_code_2,excluded.cause_of_loss,excluded.cov_effective_date,excluded.cov_expiration_date,excluded.number_of_1_desc,excluded.number_of_2,excluded.number_of_2_desc,excluded.off_dt); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go

/*** PERMISSIONS ***/
alter function sagitta.sp_ol_coverages_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_ol_coverages_upsert() to rl_sagitta_x;
go 