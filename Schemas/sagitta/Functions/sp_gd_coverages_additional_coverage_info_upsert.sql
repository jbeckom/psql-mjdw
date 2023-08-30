create or replace function sagitta.sp_gd_coverages_additional_coverage_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.gd_coverages_additional_coverage_info (
		 sagitem 
		,lis 
		,addl_coverage_cd 
		,additional_state_coverage_info 
		,state_prov_cd 
		,buyback_yes_no_cd 
		,addl_cov_form_num 
		,addl_edition_dt 
		,addl_coverage_1_limit 
		,addl_coverage_2_limit 
		,addl_deductible_1_amt 
		,addl_deductible_2_amt 
		,addl_deductible_factor 
		,addl_cov_deductible_type 
		,addl_cov_deductible_credit_pct 
		,additional_coverage_info 
		,addl_cov_1_vehicle_num 
		,addl_cov_2_vehicle_num 
		,addl_cov_3_vehicle_num 
		,addl_cov_4_vehicle_num 
		,addl_cov_5_vehicle_num 
		,addl_cov_6_vehicle_num 
		,addl_cov_7_vehicle_num 
		,miscellaneous_options_info 
		,miscellaneous_options_1_cd 
		,miscellaneous_options_2_cd 
		,addlcov_option_info 
		,addl_cov_option_1_cd 
		,addl_cov_option_2_cd 
		,addl_cov_option_3_cd 
		,addl_cov_option_4_cd 
		,addl_cov_benefits_info 
		,addl_cov_benefits_1_cd 
		,addl_cov_benefits_2_cd 
		,addl_cov_benefits_3_cd 
		,addl_cov_rate_factor 
		,addl_cov_premium_amt 
		,addl_coverage_cd_desc 
	)
	SELECT 	 sagitem 
			,lis 
			,addl_coverage_cd 
			,additional_state_coverage_info 
			,state_prov_cd 
			,buyback_yes_no_cd 
			,addl_cov_form_num 
			,addl_edition_dt 
			,addl_coverage_1_limit 
			,addl_coverage_2_limit 
			,addl_deductible_1_amt 
			,addl_deductible_2_amt 
			,addl_deductible_factor 
			,addl_cov_deductible_type 
			,addl_cov_deductible_credit_pct 
			,additional_coverage_info 
			,addl_cov_1_vehicle_num 
			,addl_cov_2_vehicle_num 
			,addl_cov_3_vehicle_num 
			,addl_cov_4_vehicle_num 
			,addl_cov_5_vehicle_num 
			,addl_cov_6_vehicle_num 
			,addl_cov_7_vehicle_num 
			,miscellaneous_options_info 
			,miscellaneous_options_1_cd 
			,miscellaneous_options_2_cd 
			,addlcov_option_info 
			,addl_cov_option_1_cd 
			,addl_cov_option_2_cd 
			,addl_cov_option_3_cd 
			,addl_cov_option_4_cd 
			,addl_cov_benefits_info 
			,addl_cov_benefits_1_cd 
			,addl_cov_benefits_2_cd 
			,addl_cov_benefits_3_cd 
			,addl_cov_rate_factor 
			,addl_cov_premium_amt 
			,addl_coverage_cd_desc 
	FROM 	sagitta.stg_gd_coverages_additional_coverage_info 
	on conflict (sagitem,lis) do update 
	set 	 addl_coverage_cd                           = excluded.addl_coverage_cd 
			,additional_state_coverage_info             = excluded.additional_state_coverage_info 
			,state_prov_cd                              = excluded.state_prov_cd 
			,buyback_yes_no_cd                          = excluded.buyback_yes_no_cd 
			,addl_cov_form_num                          = excluded.addl_cov_form_num 
			,addl_edition_dt                            = excluded.addl_edition_dt 
			,addl_coverage_1_limit                      = excluded.addl_coverage_1_limit 
			,addl_coverage_2_limit                      = excluded.addl_coverage_2_limit 
			,addl_deductible_1_amt                      = excluded.addl_deductible_1_amt 
			,addl_deductible_2_amt                      = excluded.addl_deductible_2_amt 
			,addl_deductible_factor                     = excluded.addl_deductible_factor 
			,addl_cov_deductible_type                   = excluded.addl_cov_deductible_type 
			,addl_cov_deductible_credit_pct             = excluded.addl_cov_deductible_credit_pct 
			,additional_coverage_info                   = excluded.additional_coverage_info 
			,addl_cov_1_vehicle_num                     = excluded.addl_cov_1_vehicle_num 
			,addl_cov_2_vehicle_num                     = excluded.addl_cov_2_vehicle_num 
			,addl_cov_3_vehicle_num                     = excluded.addl_cov_3_vehicle_num 
			,addl_cov_4_vehicle_num                     = excluded.addl_cov_4_vehicle_num 
			,addl_cov_5_vehicle_num                     = excluded.addl_cov_5_vehicle_num 
			,addl_cov_6_vehicle_num                     = excluded.addl_cov_6_vehicle_num 
			,addl_cov_7_vehicle_num                     = excluded.addl_cov_7_vehicle_num 
			,miscellaneous_options_info                 = excluded.miscellaneous_options_info 
			,miscellaneous_options_1_cd                 = excluded.miscellaneous_options_1_cd 
			,miscellaneous_options_2_cd                 = excluded.miscellaneous_options_2_cd 
			,addlcov_option_info                        = excluded.addlcov_option_info 
			,addl_cov_option_1_cd                       = excluded.addl_cov_option_1_cd 
			,addl_cov_option_2_cd                       = excluded.addl_cov_option_2_cd 
			,addl_cov_option_3_cd                       = excluded.addl_cov_option_3_cd 
			,addl_cov_option_4_cd                       = excluded.addl_cov_option_4_cd 
			,addl_cov_benefits_info                     = excluded.addl_cov_benefits_info 
			,addl_cov_benefits_1_cd                     = excluded.addl_cov_benefits_1_cd 
			,addl_cov_benefits_2_cd                     = excluded.addl_cov_benefits_2_cd 
			,addl_cov_benefits_3_cd                     = excluded.addl_cov_benefits_3_cd 
			,addl_cov_rate_factor                       = excluded.addl_cov_rate_factor 
			,addl_cov_premium_amt                       = excluded.addl_cov_premium_amt 
			,addl_coverage_cd_desc                      = excluded.addl_coverage_cd_desc 
	where 	(gd_coverages_additional_coverage_info.addl_coverage_cd,gd_coverages_additional_coverage_info.additional_state_coverage_info,gd_coverages_additional_coverage_info.state_prov_cd,gd_coverages_additional_coverage_info.buyback_yes_no_cd,gd_coverages_additional_coverage_info.addl_cov_form_num,gd_coverages_additional_coverage_info.addl_edition_dt,gd_coverages_additional_coverage_info.addl_coverage_1_limit,gd_coverages_additional_coverage_info.addl_coverage_2_limit,gd_coverages_additional_coverage_info.addl_deductible_1_amt,gd_coverages_additional_coverage_info.addl_deductible_2_amt,gd_coverages_additional_coverage_info.addl_deductible_factor,gd_coverages_additional_coverage_info.addl_cov_deductible_type,gd_coverages_additional_coverage_info.addl_cov_deductible_credit_pct,gd_coverages_additional_coverage_info.additional_coverage_info,gd_coverages_additional_coverage_info.addl_cov_1_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_2_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_3_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_4_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_5_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_6_vehicle_num,gd_coverages_additional_coverage_info.addl_cov_7_vehicle_num,gd_coverages_additional_coverage_info.miscellaneous_options_info,gd_coverages_additional_coverage_info.miscellaneous_options_1_cd,gd_coverages_additional_coverage_info.miscellaneous_options_2_cd,gd_coverages_additional_coverage_info.addlcov_option_info,gd_coverages_additional_coverage_info.addl_cov_option_1_cd,gd_coverages_additional_coverage_info.addl_cov_option_2_cd,gd_coverages_additional_coverage_info.addl_cov_option_3_cd,gd_coverages_additional_coverage_info.addl_cov_option_4_cd,gd_coverages_additional_coverage_info.addl_cov_benefits_info,gd_coverages_additional_coverage_info.addl_cov_benefits_1_cd,gd_coverages_additional_coverage_info.addl_cov_benefits_2_cd,gd_coverages_additional_coverage_info.addl_cov_benefits_3_cd,gd_coverages_additional_coverage_info.addl_cov_rate_factor,gd_coverages_additional_coverage_info.addl_cov_premium_amt,gd_coverages_additional_coverage_info.addl_coverage_cd_desc) 
		is distinct from 	(excluded.addl_coverage_cd,excluded.additional_state_coverage_info,excluded.state_prov_cd,excluded.buyback_yes_no_cd,excluded.addl_cov_form_num,excluded.addl_edition_dt,excluded.addl_coverage_1_limit,excluded.addl_coverage_2_limit,excluded.addl_deductible_1_amt,excluded.addl_deductible_2_amt,excluded.addl_deductible_factor,excluded.addl_cov_deductible_type,excluded.addl_cov_deductible_credit_pct,excluded.additional_coverage_info,excluded.addl_cov_1_vehicle_num,excluded.addl_cov_2_vehicle_num,excluded.addl_cov_3_vehicle_num,excluded.addl_cov_4_vehicle_num,excluded.addl_cov_5_vehicle_num,excluded.addl_cov_6_vehicle_num,excluded.addl_cov_7_vehicle_num,excluded.miscellaneous_options_info,excluded.miscellaneous_options_1_cd,excluded.miscellaneous_options_2_cd,excluded.addlcov_option_info,excluded.addl_cov_option_1_cd,excluded.addl_cov_option_2_cd,excluded.addl_cov_option_3_cd,excluded.addl_cov_option_4_cd,excluded.addl_cov_benefits_info,excluded.addl_cov_benefits_1_cd,excluded.addl_cov_benefits_2_cd,excluded.addl_cov_benefits_3_cd,excluded.addl_cov_rate_factor,excluded.addl_cov_premium_amt,excluded.addl_coverage_cd_desc); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gd_coverages_additional_coverage_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gd_coverages_additional_coverage_info_upsert() to rl_sagitta_x;
go 
