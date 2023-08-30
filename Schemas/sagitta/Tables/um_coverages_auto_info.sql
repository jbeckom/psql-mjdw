create table sagitta.um_coverages_auto_info(
     sagitem                        int             not null 
    ,lis                            int             not null 
    ,auto_pol_seq                   text            null
    ,auto_pol_number                text            null
    ,auto_insurer                   text            null
    ,auto_insurer_name              text            null
    ,auto_effective_date            text            null
    ,auto_exp_date                  text            null
    ,auto_any_auto_symbol           text            null
    ,auto_rating_mod                text            null
    ,auto_csl_limit                 text            null
    ,auto_bi_limit                  text            null
    ,auto_pd_limit                  text            null
    ,auto_csl_ann_prem              text            null
    ,auto_bi_ann_prem               text            null
    ,pd_ann_prem                    text            null
    ,constraint um_coverages_auto_info_pkey     primary key (sagitem,lis)
);
go

/*** PERMISSIONS ***/
alter table sagitta.um_coverages_auto_info owner to mj_admin;
go 

grant select on sagitta.um_coverages_auto_info to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages_auto_info to rl_sagitta_a;
go 

grant update on sagitta.um_coverages_auto_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages_auto_info for each row execute function sagitta.tr_audit_um_coverages_auto_info_d();
go 

create trigger audit_i after insert on sagitta.um_coverages_auto_info for each row execute function sagitta.tr_audit_um_coverages_auto_info_i();
go 

create trigger audit_u after update on sagitta.um_coverages_auto_info for each row when (old is distinct from new) execute function sagitta.tr_audit_um_coverages_auto_info_u();
go 