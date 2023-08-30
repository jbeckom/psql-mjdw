create table sagitta.um_coverages_employer_info (
     sagitem                                    int             not null 
    ,lis                                        int             not null 
    ,empl_pol_seq_number                        text            null 
    ,empl_pol_number                            text            null 
    ,employers_insurer                          text            null 
    ,employers_insurer_name                     text            null 
    ,employers_effective_date                   text            null 
    ,employers_exp_date                         text            null 
    ,employers_ann_prem                         text            null 
    ,employers_each_occ_limit                   text            null 
    ,employers_disease_each_employee            text            null 
    ,employers_disease_policy_limit             text            null 
    ,employers_first_rat_mod_info               text            null 
    ,employers_first_rate_mod_type              text            null 
    ,employers_first_rate_mod_amount            text            null 
    ,employers_second_rate_mod_info             text            null 
    ,employers_second_rate_mod_type             text            null 
    ,employers_second_rate_mod_amount           text            null 
    ,employers_third_rate_mod_info              text            null 
    ,employers_third_rate_mod_type              text            null 
    ,employers_third_rate_mod_amount            text            null 
    ,employers_fourth_rate_mod_info             text            null 
    ,employers_fourth_rate_mod_type             text            null 
    ,employers_fourth_rate_mod_amount           text            null 
    ,constraint um_coverages_employer_info_pkey primary key (sagitem,lis)
);
go

/*** PERMISSIONS ***/
alter table sagitta.um_coverages_employer_info owner to mj_admin;
go 

grant select on sagitta.um_coverages_employer_info to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages_employer_info to rl_sagitta_a;
go 

grant update on sagitta.um_coverages_employer_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages_employer_info for each row execute function sagitta.tr_audit_um_coverages_employer_info_d();
go 

create trigger audit_i after insert on sagitta.um_coverages_employer_info for each row execute function sagitta.tr_audit_um_coverages_employer_info_i();
go 

create trigger audit_u after update on sagitta.um_coverages_employer_info for each row when (old is distinct from new) execute function sagitta.tr_audit_um_coverages_employer_info_u();
go 
