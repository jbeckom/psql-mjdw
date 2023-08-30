create table sagitta.audit_ol_coverages (
     sagitem                                    int             not null 
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
    ,old_lob_cd                                 text            null 
    ,new_lob_cd                                 text            null 
    ,old_lob_desc                               text            null 
    ,new_lob_desc                               text            null 
    ,old_rating_basis                           text            null 
    ,new_rating_basis                           text            null 
    ,old_valuation_code_1                       text            null 
    ,new_valuation_code_1                       text            null 
    ,old_valuation_code_2                       text            null 
    ,new_valuation_code_2                       text            null 
    ,old_cause_of_loss                          text            null 
    ,new_cause_of_loss                          text            null 
    ,old_cov_effective_date                     text            null 
    ,new_cov_effective_date                     text            null 
    ,old_cov_expiration_date                    text            null 
    ,new_cov_expiration_date                    text            null 
    ,old_number_of_1_desc                       text            null 
    ,new_number_of_1_desc                       text            null 
    ,old_number_of_2                            text            null 
    ,new_number_of_2                            text            null 
    ,old_number_of_2_desc                       text            null 
    ,new_number_of_2_desc                       text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISIONS ***/
alter table sagitta.audit_ol_coverages owner to mj_admin;
go 

grant insert on sagitta.audit_ol_coverages to rl_sagitta_a;
go