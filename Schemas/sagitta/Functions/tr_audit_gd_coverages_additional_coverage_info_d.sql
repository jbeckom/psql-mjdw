create or replace function sagitta.tr_audit_gd_coverages_additional_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,old_addl_coverage_cd
        ,old_additional_state_coverage_info
        ,old_state_prov_cd
        ,old_buyback_yes_no_cd
        ,old_addl_cov_form_num
        ,old_addl_edition_dt
        ,old_addl_coverage_1_limit
        ,old_addl_coverage_2_limit
        ,old_addl_deductible_1_amt
        ,old_addl_deductible_2_amt
        ,old_addl_deductible_factor
        ,old_addl_cov_deductible_type
        ,old_addl_cov_deductible_credit_pct
        ,old_additional_coverage_info
        ,old_addl_cov_1_vehicle_num
        ,old_addl_cov_2_vehicle_num
        ,old_addl_cov_3_vehicle_num
        ,old_addl_cov_4_vehicle_num
        ,old_addl_cov_5_vehicle_num
        ,old_addl_cov_6_vehicle_num
        ,old_addl_cov_7_vehicle_num
        ,old_miscellaneous_options_info
        ,old_miscellaneous_options_1_cd
        ,old_miscellaneous_options_2_cd
        ,old_addlcov_option_info
        ,old_addl_cov_option_1_cd
        ,old_addl_cov_option_2_cd
        ,old_addl_cov_option_3_cd
        ,old_addl_cov_option_4_cd
        ,old_addl_cov_benefits_info
        ,old_addl_cov_benefits_1_cd
        ,old_addl_cov_benefits_2_cd
        ,old_addl_cov_benefits_3_cd
        ,old_addl_cov_rate_factor
        ,old_addl_cov_premium_amt
        ,old_addl_coverage_cd_desc
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.addl_coverage_cd
            ,OLD.additional_state_coverage_info
            ,OLD.state_prov_cd
            ,OLD.buyback_yes_no_cd
            ,OLD.addl_cov_form_num
            ,OLD.addl_edition_dt
            ,OLD.addl_coverage_1_limit
            ,OLD.addl_coverage_2_limit
            ,OLD.addl_deductible_1_amt
            ,OLD.addl_deductible_2_amt
            ,OLD.addl_deductible_factor
            ,OLD.addl_cov_deductible_type
            ,OLD.addl_cov_deductible_credit_pct
            ,OLD.additional_coverage_info
            ,OLD.addl_cov_1_vehicle_num
            ,OLD.addl_cov_2_vehicle_num
            ,OLD.addl_cov_3_vehicle_num
            ,OLD.addl_cov_4_vehicle_num
            ,OLD.addl_cov_5_vehicle_num
            ,OLD.addl_cov_6_vehicle_num
            ,OLD.addl_cov_7_vehicle_num
            ,OLD.miscellaneous_options_info
            ,OLD.miscellaneous_options_1_cd
            ,OLD.miscellaneous_options_2_cd
            ,OLD.addlcov_option_info
            ,OLD.addl_cov_option_1_cd
            ,OLD.addl_cov_option_2_cd
            ,OLD.addl_cov_option_3_cd
            ,OLD.addl_cov_option_4_cd
            ,OLD.addl_cov_benefits_info
            ,OLD.addl_cov_benefits_1_cd
            ,OLD.addl_cov_benefits_2_cd
            ,OLD.addl_cov_benefits_3_cd
            ,OLD.addl_cov_rate_factor
            ,OLD.addl_cov_premium_amt
            ,OLD.addl_coverage_cd_desc
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_additional_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_additional_coverage_info_d() to rl_sagitta_x;
go 
