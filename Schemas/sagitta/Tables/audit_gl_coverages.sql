create table sagitta.audit_gl_coverages (
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
    ,old_general_liab_ind                       text            null 
    ,new_general_liab_ind                       text            null 
    ,old_claims_made_ind                        text            null 
    ,new_claims_made_ind                        text            null 
    ,old_claims_occurrence_ind                  text            null 
    ,new_claims_occurrence_ind                  text            null 
    ,old_other_coverage_premium                 text            null 
    ,new_other_coverage_premium                 text            null 
    ,old_per_claim_ind                          text            null 
    ,new_per_claim_ind                          text            null 
    ,old_per_occurrence_ind                     text            null 
    ,new_per_occurrence_ind                     text            null 
    ,old_ded_basis_cd                           text            null 
    ,new_ded_basis_cd                           text            null 
    ,old_deductible                             text            null 
    ,new_deductible                             text            null 
    ,old_gen_aggregate                          text            null 
    ,new_gen_aggregate                          text            null 
    ,old_product_completed_ops_info             text            null 
    ,new_product_completed_ops_info             text            null 
    ,old_pers_advertising_injury                text            null 
    ,new_pers_advertising_injury                text            null 
    ,old_each_occurrence                        text            null 
    ,new_each_occurrence                        text            null 
    ,old_fire_legal                             text            null 
    ,new_fire_legal                             text            null 
    ,old_medical_expense                        text            null 
    ,new_medical_expense                        text            null 
    ,old_premises_operation                     text            null 
    ,new_premises_operation                     text            null 
    ,old_products_premium_amt                   text            null 
    ,new_products_premium_amt                   text            null 
    ,old_total_premium_amt                      text            null 
    ,new_total_premium_amt                      text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,old_total_other_cov_premium_amt            text            null 
    ,new_total_other_cov_premium_amt            text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gl_coverages owner to mj_admin;
go 

grant insert on sagitta.audit_gl_coverages to rl_sagitta_a;
go 
