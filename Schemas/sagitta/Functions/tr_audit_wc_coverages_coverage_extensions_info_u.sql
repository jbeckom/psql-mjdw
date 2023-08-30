create or replace function sagitta.tr_audit_wc_coverages_coverage_extensions_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages_coverage_extensions_info (
         sagitem 
        ,lis 
        ,old_coverage_cd
        ,new_coverage_cd
        ,old_state_prov_cd
        ,new_state_prov_cd
        ,old_form_number
        ,new_form_number
        ,old_edition_dt
        ,new_edition_dt
        ,old_first_ea_accident_bi_limit
        ,new_first_ea_accident_bi_limit
        ,old_second_bi_by_disease_limit
        ,new_second_bi_by_disease_limit
        ,old_third_per_employee_by_bi_limit
        ,new_third_per_employee_by_bi_limit
        ,old_coverage_extention_annual_premium_amt
        ,new_coverage_extention_annual_premium_amt
        ,old_coverage_desc
        ,new_coverage_desc
        ,old_location_number
        ,new_location_number
        ,old_type_cd
        ,new_type_cd
        ,old_deductible_1_amt
        ,new_deductible_1_amt
        ,old_deductible_2_amt
        ,new_deductible_2_amt
        ,old_deductible_1_type_cd 
        ,new_deductible_1_type_cd 
        ,old_deductible_2_type_cd 
        ,new_deductible_2_type_cd 
        ,old_rate 
        ,new_rate 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.coverage_cd
            ,new.coverage_cd
            ,old.state_prov_cd
            ,new.state_prov_cd
            ,old.form_number
            ,new.form_number
            ,old.edition_dt
            ,new.edition_dt
            ,old.first_ea_accident_bi_limit
            ,new.first_ea_accident_bi_limit
            ,old.second_bi_by_disease_limit
            ,new.second_bi_by_disease_limit
            ,old.third_per_employee_by_bi_limit
            ,new.third_per_employee_by_bi_limit
            ,old.coverage_extention_annual_premium_amt
            ,new.coverage_extention_annual_premium_amt
            ,old.coverage_desc
            ,new.coverage_desc
            ,old.location_number
            ,new.location_number
            ,old.type_cd
            ,new.type_cd
            ,old.deductible_1_amt
            ,new.deductible_1_amt
            ,old.deductible_2_amt
            ,new.deductible_2_amt
            ,old.deductible_1_type_cd 
            ,new.deductible_1_type_cd 
            ,old.deductible_2_type_cd 
            ,new.deductible_2_type_cd 
            ,old.rate 
            ,new.rate 
            ,'U';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_coverage_extensions_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_coverage_extensions_info_u() to rl_sagitta_x;
go 
