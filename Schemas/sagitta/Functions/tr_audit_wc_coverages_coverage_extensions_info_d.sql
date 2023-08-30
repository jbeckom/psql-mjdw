create or replace function sagitta.tr_audit_wc_coverages_coverage_extensions_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages_coverage_extensions_info (
         sagitem 
        ,lis 
        ,old_coverage_cd
        ,old_state_prov_cd
        ,old_form_number
        ,old_edition_dt
        ,old_first_ea_accident_bi_limit
        ,old_second_bi_by_disease_limit
        ,old_third_per_employee_by_bi_limit
        ,old_coverage_extention_annual_premium_amt
        ,old_coverage_desc
        ,old_location_number
        ,old_type_cd
        ,old_deductible_1_amt
        ,old_deductible_2_amt
        ,old_deductible_1_type_cd 
        ,old_deductible_2_type_cd 
        ,old_rate 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.coverage_cd
            ,old.state_prov_cd
            ,old.form_number
            ,old.edition_dt
            ,old.first_ea_accident_bi_limit
            ,old.second_bi_by_disease_limit
            ,old.third_per_employee_by_bi_limit
            ,old.coverage_extention_annual_premium_amt
            ,old.coverage_desc
            ,old.location_number
            ,old.type_cd
            ,old.deductible_1_amt
            ,old.deductible_2_amt
            ,old.deductible_1_type_cd 
            ,old.deductible_2_type_cd 
            ,old.rate 
            ,'D';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_coverage_extensions_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_coverage_extensions_info_d() to rl_sagitta_x;
go 
