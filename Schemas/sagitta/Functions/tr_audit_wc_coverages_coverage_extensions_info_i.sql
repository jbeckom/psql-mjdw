create or replace function sagitta.tr_audit_wc_coverages_coverage_extensions_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages_coverage_extensions_info (
         sagitem 
        ,lis 
        ,new_coverage_cd
        ,new_state_prov_cd
        ,new_form_number
        ,new_edition_dt
        ,new_first_ea_accident_bi_limit
        ,new_second_bi_by_disease_limit
        ,new_third_per_employee_by_bi_limit
        ,new_coverage_extention_annual_premium_amt
        ,new_coverage_desc
        ,new_location_number
        ,new_type_cd
        ,new_deductible_1_amt
        ,new_deductible_2_amt
        ,new_deductible_1_type_cd 
        ,new_deductible_2_type_cd 
        ,new_rate 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.coverage_cd
            ,new.state_prov_cd
            ,new.form_number
            ,new.edition_dt
            ,new.first_ea_accident_bi_limit
            ,new.second_bi_by_disease_limit
            ,new.third_per_employee_by_bi_limit
            ,new.coverage_extention_annual_premium_amt
            ,new.coverage_desc
            ,new.location_number
            ,new.type_cd
            ,new.deductible_1_amt
            ,new.deductible_2_amt
            ,new.deductible_1_type_cd 
            ,new.deductible_2_type_cd 
            ,new.rate 
            ,'I';
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_coverage_extensions_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_coverage_extensions_info_i() to rl_sagitta_x;
go 
