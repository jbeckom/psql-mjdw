create or replace function sagitta.sp_um_coverages_upsert()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin
	insert into sagitta.um_coverages (
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
        ,follow_umb_form 
        ,follow_form_excess 
        ,umbrella_excess 
        ,liab_each_occur_limit 
        ,liab_annual_aggregate 
        ,retained_limit 
        ,first_dollar_defense 
        ,current_retro_date 
        ,off_dt 
        ,desc_of_underlying_cov 
        ,garagekeepers_coverage 
        ,garagekeepers_exposure 
        ,aircraft_pass_coverage 
        ,aircraft_pass_exposure 
        ,care_custody_coverage 
        ,care_custody_exposure 
        ,professional_coverage 
        ,professional_exposure 
        ,foreign_liab_coverage 
        ,foreign_liab_exposure 
        ,malpractice_coverage 
        ,malpractive_exposure 
        ,aircraft_liab_coverage 
        ,aircraft_liab_exposure 
        ,add_int_coverage 
        ,add_int_exposure 
        ,emp_benefit_coverage 
        ,emp_benefit_exposure 
        ,liquor_coverage 
        ,liquor_exposure 
        ,pollution_coverage 
        ,pollution_exposure 
        ,vendors_liab_coverage 
        ,vendors_liab_exposure 
        ,watercraft_coverage 
        ,watercraft_exposure 
        ,first_other_description 
        ,first_other_coverage 
        ,first_other_exposure 
        ,second_other_description 
        ,second_other_coverage 
        ,second_other_exposure 
        ,third_other_description 
        ,third_other_coverage 
        ,third_other_exposure 
        ,fourth_other_description 
        ,fourth_other_coverage 
        ,fourth_other_exposure 
        ,retro_coverage_yes_no_cd 
        ,retro_proposed_date 
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
			,follow_umb_form 
			,follow_form_excess 
			,umbrella_excess 
			,liab_each_occur_limit 
			,liab_annual_aggregate 
			,retained_limit 
			,first_dollar_defense 
			,current_retro_date 
			,off_dt 
			,desc_of_underlying_cov 
			,garagekeepers_coverage 
			,garagekeepers_exposure 
			,aircraft_pass_coverage 
			,aircraft_pass_exposure 
			,care_custody_coverage 
			,care_custody_exposure 
			,professional_coverage 
			,professional_exposure 
			,foreign_liab_coverage 
			,foreign_liab_exposure 
			,malpractice_coverage 
			,malpractive_exposure 
			,aircraft_liab_coverage 
			,aircraft_liab_exposure 
			,add_int_coverage 
			,add_int_exposure 
			,emp_benefit_coverage 
			,emp_benefit_exposure 
			,liquor_coverage 
			,liquor_exposure 
			,pollution_coverage 
			,pollution_exposure 
			,vendors_liab_coverage 
			,vendors_liab_exposure 
			,watercraft_coverage 
			,watercraft_exposure 
			,first_other_description 
			,first_other_coverage 
			,first_other_exposure 
			,second_other_description 
			,second_other_coverage 
			,second_other_exposure 
			,third_other_description 
			,third_other_coverage 
			,third_other_exposure 
			,fourth_other_description 
			,fourth_other_coverage 
			,fourth_other_exposure 
			,retro_coverage_yes_no_cd 
			,retro_proposed_date 
	from 	sagitta.stg_um_coverages 
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
			,follow_umb_form 				= excluded.follow_umb_form 
			,follow_form_excess 			= excluded.follow_form_excess 
			,umbrella_excess 				= excluded.umbrella_excess 
			,liab_each_occur_limit 			= excluded.liab_each_occur_limit 
			,liab_annual_aggregate 			= excluded.liab_annual_aggregate 
			,retained_limit 				= excluded.retained_limit 
			,first_dollar_defense 			= excluded.first_dollar_defense 
			,current_retro_date 			= excluded.current_retro_date 
			,off_dt 						= excluded.off_dt 
			,desc_of_underlying_cov 		= excluded.desc_of_underlying_cov 
			,garagekeepers_coverage 		= excluded.garagekeepers_coverage 
			,garagekeepers_exposure 		= excluded.garagekeepers_exposure 
			,aircraft_pass_coverage 		= excluded.aircraft_pass_coverage 
			,aircraft_pass_exposure 		= excluded.aircraft_pass_exposure 
			,care_custody_coverage 			= excluded.care_custody_coverage 
			,care_custody_exposure 			= excluded.care_custody_exposure 
			,professional_coverage 			= excluded.professional_coverage 
			,professional_exposure 			= excluded.professional_exposure 
			,foreign_liab_coverage 			= excluded.foreign_liab_coverage 
			,foreign_liab_exposure 			= excluded.foreign_liab_exposure 
			,malpractice_coverage 			= excluded.malpractice_coverage 
			,malpractive_exposure 			= excluded.malpractive_exposure 
			,aircraft_liab_coverage 		= excluded.aircraft_liab_coverage 
			,aircraft_liab_exposure 		= excluded.aircraft_liab_exposure 
			,add_int_coverage 				= excluded.add_int_coverage 
			,add_int_exposure 				= excluded.add_int_exposure 
			,emp_benefit_coverage 			= excluded.emp_benefit_coverage 
			,emp_benefit_exposure 			= excluded.emp_benefit_exposure 
			,liquor_coverage 				= excluded.liquor_coverage 
			,liquor_exposure 				= excluded.liquor_exposure 
			,pollution_coverage 			= excluded.pollution_coverage 
			,pollution_exposure 			= excluded.pollution_exposure 
			,vendors_liab_coverage 			= excluded.vendors_liab_coverage 
			,vendors_liab_exposure 			= excluded.vendors_liab_exposure 
			,watercraft_coverage 			= excluded.watercraft_coverage 
			,watercraft_exposure 			= excluded.watercraft_exposure 
			,first_other_description 		= excluded.first_other_description 
			,first_other_coverage 			= excluded.first_other_coverage 
			,first_other_exposure 			= excluded.first_other_exposure 
			,second_other_description 		= excluded.second_other_description 
			,second_other_coverage 			= excluded.second_other_coverage 
			,second_other_exposure 			= excluded.second_other_exposure 
			,third_other_description 		= excluded.third_other_description 
			,third_other_coverage 			= excluded.third_other_coverage 
			,third_other_exposure 			= excluded.third_other_exposure 
			,fourth_other_description 		= excluded.fourth_other_description 
			,fourth_other_coverage 			= excluded.fourth_other_coverage 
			,fourth_other_exposure 			= excluded.fourth_other_exposure 
			,retro_coverage_yes_no_cd 		= excluded.retro_coverage_yes_no_cd 
			,retro_proposed_date 			= excluded.retro_proposed_date 
	where 	(um_coverages.audit_staff_cd,um_coverages.audit_entry_dt,um_coverages.audit_time,um_coverages.audit_cd,um_coverages.audit_history_record_number,um_coverages.audit_program,um_coverages.audit_effective_dt,um_coverages.audit_change_agency_id,um_coverages.policy_agency_id,um_coverages.follow_umb_form,um_coverages.follow_form_excess,um_coverages.umbrella_excess,um_coverages.liab_each_occur_limit,um_coverages.liab_annual_aggregate,um_coverages.retained_limit,um_coverages.first_dollar_defense,um_coverages.current_retro_date,um_coverages.off_dt,um_coverages.desc_of_underlying_cov,um_coverages.garagekeepers_coverage,um_coverages.garagekeepers_exposure,um_coverages.aircraft_pass_coverage,um_coverages.aircraft_pass_exposure,um_coverages.care_custody_coverage,um_coverages.care_custody_exposure,um_coverages.professional_coverage,um_coverages.professional_exposure,um_coverages.foreign_liab_coverage,um_coverages.foreign_liab_exposure,um_coverages.malpractice_coverage,um_coverages.malpractive_exposure,um_coverages.aircraft_liab_coverage,um_coverages.aircraft_liab_exposure,um_coverages.add_int_coverage,um_coverages.add_int_exposure,um_coverages.emp_benefit_coverage,um_coverages.emp_benefit_exposure,um_coverages.liquor_coverage,um_coverages.liquor_exposure,um_coverages.pollution_coverage,um_coverages.pollution_exposure,um_coverages.vendors_liab_coverage,um_coverages.vendors_liab_exposure,um_coverages.watercraft_coverage,um_coverages.watercraft_exposure,um_coverages.first_other_description,um_coverages.first_other_coverage,um_coverages.first_other_exposure,um_coverages.second_other_description,um_coverages.second_other_coverage,um_coverages.second_other_exposure,um_coverages.third_other_description,um_coverages.third_other_coverage,um_coverages.third_other_exposure,um_coverages.fourth_other_description,um_coverages.fourth_other_coverage,um_coverages.fourth_other_exposure,um_coverages.retro_coverage_yes_no_cd,um_coverages.retro_proposed_date) 
		is distinct from 	(excluded.audit_staff_cd,excluded.audit_entry_dt,excluded.audit_time,excluded.audit_cd,excluded.audit_history_record_number,excluded.audit_program,excluded.audit_effective_dt,excluded.audit_change_agency_id,excluded.policy_agency_id,excluded.follow_umb_form,excluded.follow_form_excess,excluded.umbrella_excess,excluded.liab_each_occur_limit,excluded.liab_annual_aggregate,excluded.retained_limit,excluded.first_dollar_defense,excluded.current_retro_date,excluded.off_dt,excluded.desc_of_underlying_cov,excluded.garagekeepers_coverage,excluded.garagekeepers_exposure,excluded.aircraft_pass_coverage,excluded.aircraft_pass_exposure,excluded.care_custody_coverage,excluded.care_custody_exposure,excluded.professional_coverage,excluded.professional_exposure,excluded.foreign_liab_coverage,excluded.foreign_liab_exposure,excluded.malpractice_coverage,excluded.malpractive_exposure,excluded.aircraft_liab_coverage,excluded.aircraft_liab_exposure,excluded.add_int_coverage,excluded.add_int_exposure,excluded.emp_benefit_coverage,excluded.emp_benefit_exposure,excluded.liquor_coverage,excluded.liquor_exposure,excluded.pollution_coverage,excluded.pollution_exposure,excluded.vendors_liab_coverage,excluded.vendors_liab_exposure,excluded.watercraft_coverage,excluded.watercraft_exposure,excluded.first_other_description,excluded.first_other_coverage,excluded.first_other_exposure,excluded.second_other_description,excluded.second_other_coverage,excluded.second_other_exposure,excluded.third_other_description,excluded.third_other_coverage,excluded.third_other_exposure,excluded.fourth_other_description,excluded.fourth_other_coverage,excluded.fourth_other_exposure,excluded.retro_coverage_yes_no_cd,excluded.retro_proposed_date); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_upsert() to rl_sagitta_x;
go 
