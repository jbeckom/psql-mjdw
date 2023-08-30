create table sagitta.gl_coverages (
     sagitem                                int             not null 
    ,audit_staff_cd                         text            null 
    ,audit_entry_dt                         int             null 
    ,audit_time                             int             null 
    ,audit_cd                               text            null 
    ,audit_history_record_number            text            null 
    ,audit_program                          text            null 
    ,audit_effective_dt                     text            null 
    ,audit_change_agency_id                 text            null 
    ,policy_agency_id                       text            null 
    ,general_liab_ind                       text            null 
    ,claims_made_ind                        text            null 
    ,claims_occurrence_ind                  text            null 
    ,other_coverage_premium                 text            null 
    ,per_claim_ind                          text            null 
    ,per_occurrence_ind                     text            null 
    ,ded_basis_cd                           text            null 
    ,deductible                             text            null 
    ,gen_aggregate                          text            null 
    ,product_completed_ops_info             text            null 
    ,pers_advertising_injury                text            null 
    ,each_occurrence                        text            null 
    ,fire_legal                             text            null 
    ,medical_expense                        text            null 
    ,premises_operation                     text            null 
    ,products_premium_amt                   text            null 
    ,total_premium_amt                      text            null 
    ,off_dt                                 text            null 
    ,total_other_cov_premium_amt            text            null 
    ,constraint gl_coverages_pkey   primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gl_coverages owner to mj_admin;
go

grant select on sagitta.gl_coverages to rl_sagitta_r;
go 

grant insert on sagitta.gl_coverages to rl_sagitta_a;
go 

grant update on sagitta.gl_coverages to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gl_coverages for each row execute function sagitta.tr_audit_gl_coverages_d();
go 

create trigger audit_i after insert on sagitta.gl_coverages for each row execute function sagitta.tr_audit_gl_coverages_i();
go 

create trigger audit_u after update on sagitta.gl_coverages for each row when (old is distinct from new) execute function sagitta.tr_audit_gl_coverages_u();
go 
