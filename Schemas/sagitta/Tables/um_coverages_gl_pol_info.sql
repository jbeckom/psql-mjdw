create table sagitta.um_coverages_gl_pol_info (
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,gl_pol_seq_number                      text            null
    ,gl_pol_number                          text            null
    ,gl_claims_occur                        text            null
    ,gl_insurer                             text            null
    ,gl_insurer_name                        text            null
    ,gl_effective_date                      text            null
    ,gl_exp_date                            text            null
    ,gl_rate_mode                           text            null
    ,gl_each_occur_limit                    text            null
    ,gl_gen_agg_amount                      text            null
    ,gl_prod_compl_oper_limit               text            null
    ,gl_fire_damage_limit                   text            null
    ,gl_med_exp_limit                       text            null
    ,gl_pes_adv_inj_limit                   text            null
    ,gl_prem_operations_ann_prem            text            null
    ,gl_products_ann_prem                   text            null
    ,gl_other_ann_prem                      text            null
    ,constraint um_coverages_gl_pol_info_pkey   primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.um_coverages_gl_pol_info owner to mj_admin;
go 

grant select on sagitta.um_coverages_gl_pol_info to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages_gl_pol_info to rl_sagitta_a;
go 

grant update on sagitta.um_coverages_gl_pol_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages_gl_pol_info for each row execute function sagitta.tr_audit_um_coverages_gl_pol_info_d();
go 

create trigger audit_i after insert on sagitta.um_coverages_gl_pol_info for each row execute function sagitta.tr_audit_um_coverages_gl_pol_info_i();
go 

create trigger audit_u after update on sagitta.um_coverages_gl_pol_info for each row when (old is distinct from new) execute function sagitta.tr_audit_um_coverages_gl_pol_info_u();
go 
