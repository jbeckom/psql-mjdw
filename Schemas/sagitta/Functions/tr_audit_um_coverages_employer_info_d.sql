create or replace function sagitta.tr_audit_um_coverages_employer_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_um_coverages_employer_info (
         sagitem 
        ,lis 
        ,old_empl_pol_seq_number 
        ,old_empl_pol_number 
        ,old_employers_insurer 
        ,old_employers_insurer_name 
        ,old_employers_effective_date 
        ,old_employers_exp_date 
        ,old_employers_ann_prem 
        ,old_employers_each_occ_limit 
        ,old_employers_disease_each_employee 
        ,old_employers_disease_policy_limit 
        ,old_employers_first_rat_mod_info 
        ,old_employers_first_rate_mod_type 
        ,old_employers_first_rate_mod_amount 
        ,old_employers_second_rate_mod_info 
        ,old_employers_second_rate_mod_type 
        ,old_employers_second_rate_mod_amount 
        ,old_employers_third_rate_mod_info 
        ,old_employers_third_rate_mod_type 
        ,old_employers_third_rate_mod_amount 
        ,old_employers_fourth_rate_mod_info 
        ,old_employers_fourth_rate_mod_type 
        ,old_employers_fourth_rate_mod_amount 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.empl_pol_seq_number 
            ,old.empl_pol_number 
            ,old.employers_insurer 
            ,old.employers_insurer_name 
            ,old.employers_effective_date 
            ,old.employers_exp_date 
            ,old.employers_ann_prem 
            ,old.employers_each_occ_limit 
            ,old.employers_disease_each_employee 
            ,old.employers_disease_policy_limit 
            ,old.employers_first_rat_mod_info 
            ,old.employers_first_rate_mod_type 
            ,old.employers_first_rate_mod_amount 
            ,old.employers_second_rate_mod_info 
            ,old.employers_second_rate_mod_type 
            ,old.employers_second_rate_mod_amount 
            ,old.employers_third_rate_mod_info 
            ,old.employers_third_rate_mod_type 
            ,old.employers_third_rate_mod_amount 
            ,old.employers_fourth_rate_mod_info 
            ,old.employers_fourth_rate_mod_type 
            ,old.employers_fourth_rate_mod_amount 
            ,'D'; 
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_um_coverages_employer_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_um_coverages_employer_info_d() to rl_sagitta_x;
go 
