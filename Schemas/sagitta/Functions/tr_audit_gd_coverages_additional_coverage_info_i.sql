create or replace function sagitta.tr_audit_gd_coverages_additional_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_additional_coverage_info (
         sagitem 
        ,lis 
        ,new_addl_coverage_cd
        ,new_additional_state_coverage_info
        ,new_state_prov_cd
        ,new_buyback_yes_no_cd
        ,new_addl_cov_form_num
        ,new_addl_edition_dt
        ,new_addl_coverage_1_limit
        ,new_addl_coverage_2_limit
        ,new_addl_deductible_1_amt
        ,new_addl_deductible_2_amt
        ,new_addl_deductible_factor
        ,new_addl_cov_deductible_type
        ,new_addl_cov_deductible_credit_pct
        ,new_additional_coverage_info
        ,new_addl_cov_1_vehicle_num
        ,new_addl_cov_2_vehicle_num
        ,new_addl_cov_3_vehicle_num
        ,new_addl_cov_4_vehicle_num
        ,new_addl_cov_5_vehicle_num
        ,new_addl_cov_6_vehicle_num
        ,new_addl_cov_7_vehicle_num
        ,new_miscellaneous_options_info
        ,new_miscellaneous_options_1_cd
        ,new_miscellaneous_options_2_cd
        ,new_addlcov_option_info
        ,new_addl_cov_option_1_cd
        ,new_addl_cov_option_2_cd
        ,new_addl_cov_option_3_cd
        ,new_addl_cov_option_4_cd
        ,new_addl_cov_benefits_info
        ,new_addl_cov_benefits_1_cd
        ,new_addl_cov_benefits_2_cd
        ,new_addl_cov_benefits_3_cd
        ,new_addl_cov_rate_factor
        ,new_addl_cov_premium_amt
        ,new_addl_coverage_cd_desc
        ,audit_action 
    )
    select   NEW.sagitem 
            ,NEW.lis 
            ,NEW.addl_coverage_cd
            ,NEW.additional_state_coverage_info
            ,NEW.state_prov_cd
            ,NEW.buyback_yes_no_cd
            ,NEW.addl_cov_form_num
            ,NEW.addl_edition_dt
            ,NEW.addl_coverage_1_limit
            ,NEW.addl_coverage_2_limit
            ,NEW.addl_deductible_1_amt
            ,NEW.addl_deductible_2_amt
            ,NEW.addl_deductible_factor
            ,NEW.addl_cov_deductible_type
            ,NEW.addl_cov_deductible_credit_pct
            ,NEW.additional_coverage_info
            ,NEW.addl_cov_1_vehicle_num
            ,NEW.addl_cov_2_vehicle_num
            ,NEW.addl_cov_3_vehicle_num
            ,NEW.addl_cov_4_vehicle_num
            ,NEW.addl_cov_5_vehicle_num
            ,NEW.addl_cov_6_vehicle_num
            ,NEW.addl_cov_7_vehicle_num
            ,NEW.miscellaneous_options_info
            ,NEW.miscellaneous_options_1_cd
            ,NEW.miscellaneous_options_2_cd
            ,NEW.addlcov_option_info
            ,NEW.addl_cov_option_1_cd
            ,NEW.addl_cov_option_2_cd
            ,NEW.addl_cov_option_3_cd
            ,NEW.addl_cov_option_4_cd
            ,NEW.addl_cov_benefits_info
            ,NEW.addl_cov_benefits_1_cd
            ,NEW.addl_cov_benefits_2_cd
            ,NEW.addl_cov_benefits_3_cd
            ,NEW.addl_cov_rate_factor
            ,NEW.addl_cov_premium_amt
            ,NEW.addl_coverage_cd_desc
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_additional_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_additional_coverage_info_i() to rl_sagitta_x;
go 
