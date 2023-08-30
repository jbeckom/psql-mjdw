create table sagitta.audit_um_coverages_auto_info(
     sagitem                        int             not null 
    ,lis                            int             not null 
    ,old_auto_pol_seq                   text            null
    ,new_auto_pol_seq                   text            null
    ,old_auto_pol_number                text            null
    ,new_auto_pol_number                text            null
    ,old_auto_insurer                   text            null
    ,new_auto_insurer                   text            null
    ,old_auto_insurer_name              text            null
    ,new_auto_insurer_name              text            null
    ,old_auto_effective_date            text            null
    ,new_auto_effective_date            text            null
    ,old_auto_exp_date                  text            null
    ,new_auto_exp_date                  text            null
    ,old_auto_any_auto_symbol           text            null
    ,new_auto_any_auto_symbol           text            null
    ,old_auto_rating_mod                text            null
    ,new_auto_rating_mod                text            null
    ,old_auto_csl_limit                 text            null
    ,new_auto_csl_limit                 text            null
    ,old_auto_bi_limit                  text            null
    ,new_auto_bi_limit                  text            null
    ,old_auto_pd_limit                  text            null
    ,new_auto_pd_limit                  text            null
    ,old_auto_csl_ann_prem              text            null
    ,new_auto_csl_ann_prem              text            null
    ,old_auto_bi_ann_prem               text            null
    ,new_auto_bi_ann_prem               text            null
    ,old_pd_ann_prem                    text            null
    ,new_pd_ann_prem                    text            null
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages_auto_info owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages_auto_info to rl_sagitta_a;
go 
