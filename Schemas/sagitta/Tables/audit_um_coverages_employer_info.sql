create table sagitta.audit_um_coverages_employer_info (
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,old_empl_pol_seq_number                        text            null 
    ,new_empl_pol_seq_number                        text            null 
    ,old_empl_pol_number                            text            null 
    ,new_empl_pol_number                            text            null 
    ,old_employers_insurer                          text            null 
    ,new_employers_insurer                          text            null 
    ,old_employers_insurer_name                     text            null 
    ,new_employers_insurer_name                     text            null 
    ,old_employers_effective_date                   text            null 
    ,new_employers_effective_date                   text            null 
    ,old_employers_exp_date                         text            null 
    ,new_employers_exp_date                         text            null 
    ,old_employers_ann_prem                         text            null 
    ,new_employers_ann_prem                         text            null 
    ,old_employers_each_occ_limit                   text            null 
    ,new_employers_each_occ_limit                   text            null 
    ,old_employers_disease_each_employee            text            null 
    ,new_employers_disease_each_employee            text            null 
    ,old_employers_disease_policy_limit             text            null 
    ,new_employers_disease_policy_limit             text            null 
    ,old_employers_first_rat_mod_info               text            null 
    ,new_employers_first_rat_mod_info               text            null 
    ,old_employers_first_rate_mod_type              text            null 
    ,new_employers_first_rate_mod_type              text            null 
    ,old_employers_first_rate_mod_amount            text            null 
    ,new_employers_first_rate_mod_amount            text            null 
    ,old_employers_second_rate_mod_info             text            null 
    ,new_employers_second_rate_mod_info             text            null 
    ,old_employers_second_rate_mod_type             text            null 
    ,new_employers_second_rate_mod_type             text            null 
    ,old_employers_second_rate_mod_amount           text            null 
    ,new_employers_second_rate_mod_amount           text            null 
    ,old_employers_third_rate_mod_info              text            null 
    ,new_employers_third_rate_mod_info              text            null 
    ,old_employers_third_rate_mod_type              text            null 
    ,new_employers_third_rate_mod_type              text            null 
    ,old_employers_third_rate_mod_amount            text            null 
    ,new_employers_third_rate_mod_amount            text            null 
    ,old_employers_fourth_rate_mod_info             text            null 
    ,new_employers_fourth_rate_mod_info             text            null 
    ,old_employers_fourth_rate_mod_type             text            null 
    ,new_employers_fourth_rate_mod_type             text            null 
    ,old_employers_fourth_rate_mod_amount           text            null 
    ,new_employers_fourth_rate_mod_amount           text            null 
    ,audit_action                                   char(1)         not null 
    ,audit_user                                     text            not null            default current_user 
    ,audit_timestamp                                timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages_employer_info owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages_employer_info to rl_sagitta_a;
go 
