create table sagitta.wc_coverages(
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int 			null 
    ,audit_time                             int 			null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,audit_change_agency_id                 text            null 
    ,policy_agency_id                       text            null 
    ,empl_liab_acc_limit                    text            null 
    ,disease_per_empl_limit                 text            null 
    ,disease_policy_limit                   text            null 
    ,empl_liab_premium_amt                  text            null 
    ,uslh_ind                               text            null 
    ,uslh_premium_amt                       text            null 
    ,voluntary_comp_ind                     text            null 
    ,voluntary_comp_premium_amt             text            null 
    ,other_states_ind                       text            null 
    ,other_states_premium_amt               text            null 
    ,excluded_states                        text            null 
    ,included_states                        text            null 
    ,off_dt                                 text            null 
    ,rate                                   text            null 
    ,statutory_limits_apply                 text            null 
    ,constraint wc_coverages_pkey   primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.wc_coverages owner to mj_admin;
go 

grant select on sagitta.wc_coverages to rl_sagitta_r;
go 

grant insert on sagitta.wc_coverages to rl_sagitta_a;
go 

grant update on sagitta.wc_coverages to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.wc_coverages for each row execute function sagitta.tr_audit_wc_coverages_d();
go 

create trigger audit_i after insert on sagitta.wc_coverages for each row execute function sagitta.tr_audit_wc_coverages_i();
go 

create trigger audit_u after update on sagitta.wc_coverages for each row when (old is distinct from new) execute function sagitta.tr_audit_wc_coverages_u();
go 