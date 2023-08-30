create table sagitta.audit_um_coverages_gl_pol_info (
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,old_gl_pol_seq_number                      text            null
    ,new_gl_pol_seq_number                      text            null
    ,old_gl_pol_number                          text            null
    ,new_gl_pol_number                          text            null
    ,old_gl_claims_occur                        text            null
    ,new_gl_claims_occur                        text            null
    ,old_gl_insurer                             text            null
    ,new_gl_insurer                             text            null
    ,old_gl_insurer_name                        text            null
    ,new_gl_insurer_name                        text            null
    ,old_gl_effective_date                      text            null
    ,new_gl_effective_date                      text            null
    ,old_gl_exp_date                            text            null
    ,new_gl_exp_date                            text            null
    ,old_gl_rate_mode                           text            null
    ,new_gl_rate_mode                           text            null
    ,old_gl_each_occur_limit                    text            null
    ,new_gl_each_occur_limit                    text            null
    ,old_gl_gen_agg_amount                      text            null
    ,new_gl_gen_agg_amount                      text            null
    ,old_gl_prod_compl_oper_limit               text            null
    ,new_gl_prod_compl_oper_limit               text            null
    ,old_gl_fire_damage_limit                   text            null
    ,new_gl_fire_damage_limit                   text            null
    ,old_gl_med_exp_limit                       text            null
    ,new_gl_med_exp_limit                       text            null
    ,old_gl_pes_adv_inj_limit                   text            null
    ,new_gl_pes_adv_inj_limit                   text            null
    ,old_gl_prem_operations_ann_prem            text            null
    ,new_gl_prem_operations_ann_prem            text            null
    ,old_gl_products_ann_prem                   text            null
    ,new_gl_products_ann_prem                   text            null
    ,old_gl_other_ann_prem                      text            null
    ,new_gl_other_ann_prem                      text            null
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages_gl_pol_info owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages_gl_pol_info to rl_sagitta_a;
go 