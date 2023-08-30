create or replace function sagitta.sp_um_coverages_employer_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.um_coverages_employer_info (
         sagitem 
        ,lis 
        ,empl_pol_seq_number 
        ,empl_pol_number 
        ,employers_insurer 
        ,employers_insurer_name 
        ,employers_effective_date 
        ,employers_exp_date 
        ,employers_ann_prem 
        ,employers_each_occ_limit 
        ,employers_disease_each_employee 
        ,employers_disease_policy_limit 
        ,employers_first_rat_mod_info 
        ,employers_first_rate_mod_type 
        ,employers_first_rate_mod_amount 
        ,employers_second_rate_mod_info 
        ,employers_second_rate_mod_type 
        ,employers_second_rate_mod_amount 
        ,employers_third_rate_mod_info 
        ,employers_third_rate_mod_type 
        ,employers_third_rate_mod_amount 
        ,employers_fourth_rate_mod_info 
        ,employers_fourth_rate_mod_type 
        ,employers_fourth_rate_mod_amount 
    )
    select   sagitem 
            ,lis 
            ,empl_pol_seq_number 
            ,empl_pol_number 
            ,employers_insurer 
            ,employers_insurer_name 
            ,employers_effective_date 
            ,employers_exp_date 
            ,employers_ann_prem 
            ,employers_each_occ_limit 
            ,employers_disease_each_employee 
            ,employers_disease_policy_limit 
            ,employers_first_rat_mod_info 
            ,employers_first_rate_mod_type 
            ,employers_first_rate_mod_amount 
            ,employers_second_rate_mod_info 
            ,employers_second_rate_mod_type 
            ,employers_second_rate_mod_amount 
            ,employers_third_rate_mod_info 
            ,employers_third_rate_mod_type 
            ,employers_third_rate_mod_amount 
            ,employers_fourth_rate_mod_info 
            ,employers_fourth_rate_mod_type 
            ,employers_fourth_rate_mod_amount 
    from    sagitta.stg_um_coverages_employer_info 
    on conflict (sagitem,lis) do update 
    set      empl_pol_seq_number                        = excluded.empl_pol_seq_number 
            ,empl_pol_number                            = excluded.empl_pol_number 
            ,employers_insurer                          = excluded.employers_insurer 
            ,employers_insurer_name                     = excluded.employers_insurer_name 
            ,employers_effective_date                   = excluded.employers_effective_date 
            ,employers_exp_date                         = excluded.employers_exp_date 
            ,employers_ann_prem                         = excluded.employers_ann_prem 
            ,employers_each_occ_limit                   = excluded.employers_each_occ_limit 
            ,employers_disease_each_employee            = excluded.employers_disease_each_employee 
            ,employers_disease_policy_limit             = excluded.employers_disease_policy_limit 
            ,employers_first_rat_mod_info               = excluded.employers_first_rat_mod_info 
            ,employers_first_rate_mod_type              = excluded.employers_first_rate_mod_type 
            ,employers_first_rate_mod_amount            = excluded.employers_first_rate_mod_amount 
            ,employers_second_rate_mod_info             = excluded.employers_second_rate_mod_info 
            ,employers_second_rate_mod_type             = excluded.employers_second_rate_mod_type 
            ,employers_second_rate_mod_amount           = excluded.employers_second_rate_mod_amount 
            ,employers_third_rate_mod_info              = excluded.employers_third_rate_mod_info 
            ,employers_third_rate_mod_type              = excluded.employers_third_rate_mod_type 
            ,employers_third_rate_mod_amount            = excluded.employers_third_rate_mod_amount 
            ,employers_fourth_rate_mod_info             = excluded.employers_fourth_rate_mod_info 
            ,employers_fourth_rate_mod_type             = excluded.employers_fourth_rate_mod_type 
            ,employers_fourth_rate_mod_amount           = excluded.employers_fourth_rate_mod_amount 
    where   (um_coverages_employer_info.empl_pol_seq_number,um_coverages_employer_info.empl_pol_number,um_coverages_employer_info.employers_insurer,um_coverages_employer_info.employers_insurer_name,um_coverages_employer_info.employers_effective_date,um_coverages_employer_info.employers_exp_date,um_coverages_employer_info.employers_ann_prem,um_coverages_employer_info.employers_each_occ_limit,um_coverages_employer_info.employers_disease_each_employee,um_coverages_employer_info.employers_disease_policy_limit,um_coverages_employer_info.employers_first_rat_mod_info,um_coverages_employer_info.employers_first_rate_mod_type,um_coverages_employer_info.employers_first_rate_mod_amount,um_coverages_employer_info.employers_second_rate_mod_info,um_coverages_employer_info.employers_second_rate_mod_type,um_coverages_employer_info.employers_second_rate_mod_amount,um_coverages_employer_info.employers_third_rate_mod_info,um_coverages_employer_info.employers_third_rate_mod_type,um_coverages_employer_info.employers_third_rate_mod_amount,um_coverages_employer_info.employers_fourth_rate_mod_info,um_coverages_employer_info.employers_fourth_rate_mod_type,um_coverages_employer_info.employers_fourth_rate_mod_amount) 
        is distinct from    (excluded.empl_pol_seq_number,excluded.empl_pol_number,excluded.employers_insurer,excluded.employers_insurer_name,excluded.employers_effective_date,excluded.employers_exp_date,excluded.employers_ann_prem,excluded.employers_each_occ_limit,excluded.employers_disease_each_employee,excluded.employers_disease_policy_limit,excluded.employers_first_rat_mod_info,excluded.employers_first_rate_mod_type,excluded.employers_first_rate_mod_amount,excluded.employers_second_rate_mod_info,excluded.employers_second_rate_mod_type,excluded.employers_second_rate_mod_amount,excluded.employers_third_rate_mod_info,excluded.employers_third_rate_mod_type,excluded.employers_third_rate_mod_amount,excluded.employers_fourth_rate_mod_info,excluded.employers_fourth_rate_mod_type,excluded.employers_fourth_rate_mod_amount); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_employer_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_employer_info_upsert() to rl_sagitta_x;
go 
