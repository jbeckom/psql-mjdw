create table sagitta.gs_coverages (
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
    ,glass_deductible                       text            null 
    ,glass_retention_pct                    text            null 
    ,large_glass_option_ind                 text            null 
    ,sign_full_form_coverage_ind            text            null 
    ,sign_deductible_clause_ind             text            null 
    ,off_dt                                 text            null 
    ,lis_count_glass_info                   text            null 
    ,lis_count_sign_item_info               text            null 
    ,constraint gs_coverages_pkey   primary key (sagitem)
);
go

/*** PERMISSIONS ***/
alter table sagitta.gs_coverages owner to mj_admin;
go 

grant select on sagitta.gs_coverages to rl_sagitta_r;
go 

grant insert on sagitta.gs_coverages to rl_sagitta_a;
go 

grant update on sagitta.gs_coverages to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gs_coverages for each row execute function sagitta.tr_audit_gs_coverages_d();
go 

create trigger audit_i after insert on sagitta.gs_coverages for each row execute function sagitta.tr_audit_gs_coverages_i();
go 

create trigger audit_u after update on sagitta.gs_coverages for each row when (old is distinct from new) execute function sagitta.tr_audit_gs_coverages_u();
go