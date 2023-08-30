create or replace function sagitta.tr_audit_um_coverages_employer_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_employer_info (
         sagitem 
        ,lis 
        ,new_empl_pol_seq_number 
        ,new_empl_pol_number 
        ,new_employers_insurer 
        ,new_employers_insurer_name 
        ,new_employers_effective_date 
        ,new_employers_exp_date 
        ,new_employers_ann_prem 
        ,new_employers_each_occ_limit 
        ,new_employers_disease_each_employee 
        ,new_employers_disease_policy_limit 
        ,new_employers_first_rat_mod_info 
        ,new_employers_first_rate_mod_type 
        ,new_employers_first_rate_mod_amount 
        ,new_employers_second_rate_mod_info 
        ,new_employers_second_rate_mod_type 
        ,new_employers_second_rate_mod_amount 
        ,new_employers_third_rate_mod_info 
        ,new_employers_third_rate_mod_type 
        ,new_employers_third_rate_mod_amount 
        ,new_employers_fourth_rate_mod_info 
        ,new_employers_fourth_rate_mod_type 
        ,new_employers_fourth_rate_mod_amount 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.empl_pol_seq_number 
            ,new.empl_pol_number 
            ,new.employers_insurer 
            ,new.employers_insurer_name 
            ,new.employers_effective_date 
            ,new.employers_exp_date 
            ,new.employers_ann_prem 
            ,new.employers_each_occ_limit 
            ,new.employers_disease_each_employee 
            ,new.employers_disease_policy_limit 
            ,new.employers_first_rat_mod_info 
            ,new.employers_first_rate_mod_type 
            ,new.employers_first_rate_mod_amount 
            ,new.employers_second_rate_mod_info 
            ,new.employers_second_rate_mod_type 
            ,new.employers_second_rate_mod_amount 
            ,new.employers_third_rate_mod_info 
            ,new.employers_third_rate_mod_type 
            ,new.employers_third_rate_mod_amount 
            ,new.employers_fourth_rate_mod_info 
            ,new.employers_fourth_rate_mod_type 
            ,new.employers_fourth_rate_mod_amount 
            ,'I'; 
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_employer_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_employer_info_i() to rl_sagitta_x;
go 
