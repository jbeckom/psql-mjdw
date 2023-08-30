create table sagitta.audit_gs_coverages (
     sagitem                                int             not null 
    ,old_audit_staff_cd                         text            null 
    ,new_audit_staff_cd                         text            null 
    ,old_audit_entry_dt                         int             null 
    ,new_audit_entry_dt                         int             null 
    ,old_audit_time                             int             null 
    ,new_audit_time                             int             null 
    ,old_audit_cd                               text            null 
    ,new_audit_cd                               text            null 
    ,old_audit_history_record_number            text            null 
    ,new_audit_history_record_number            text            null 
    ,old_audit_program                          text            null 
    ,new_audit_program                          text            null 
    ,old_audit_effective_dt                     text            null 
    ,new_audit_effective_dt                     text            null 
    ,old_audit_change_agency_id                 text            null 
    ,new_audit_change_agency_id                 text            null 
    ,old_policy_agency_id                       text            null 
    ,new_policy_agency_id                       text            null 
    ,old_glass_deductible                       text            null 
    ,new_glass_deductible                       text            null 
    ,old_glass_retention_pct                    text            null 
    ,new_glass_retention_pct                    text            null 
    ,old_large_glass_option_ind                 text            null 
    ,new_large_glass_option_ind                 text            null 
    ,old_sign_full_form_coverage_ind            text            null 
    ,new_sign_full_form_coverage_ind            text            null 
    ,old_sign_deductible_clause_ind             text            null 
    ,new_sign_deductible_clause_ind             text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,old_lis_count_glass_info                   text            null 
    ,new_lis_count_glass_info                   text            null 
    ,old_lis_count_sign_item_info               text            null 
    ,new_lis_count_sign_item_info               text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestmap                            timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gs_coverages owner to mj_admin;
go 

grant insert on sagitta.audit_gs_coverages to rl_sagitta_a;
go 
