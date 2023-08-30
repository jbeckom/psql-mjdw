drop table if exists sagitta.audit_company_master;

create table if not exists sagitta.audit_company_master (
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
    ,old_division_name                          text            null 
    ,new_division_name                          text            null 
    ,old_addr_1                                 text            null 
    ,new_addr_1                                 text            null 
    ,old_addr_2                                 text            null 
    ,new_addr_2                                 text            null 
    ,old_postal_code                            text            null 
    ,new_postal_code                            text            null 
    ,old_postal_extension_code                  text            null 
    ,new_postal_extension_code                  text            null 
    ,old_phone_1_number                         text            null 
    ,new_phone_1_number                         text            null 
    ,old_phone_2_number                         text            null 
    ,new_phone_2_number                         text            null 
    ,old_gl_format                              text            null 
    ,new_gl_format                              text            null 
    ,old_division_gl_suspense_acct              text            null 
    ,new_division_gl_suspense_acct              text            null 
    ,old_prefill_acord_forms_yn_cd              text            null 
    ,new_prefill_acord_forms_yn_cd              text            null 
    ,old_fax_number                             text            null 
    ,new_fax_number                             text            null 
    ,old_ny_license_code                        text            null 
    ,new_ny_license_code                        text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_company_master OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE sagitta.audit_company_master TO rl_sagitta_a;
GO 
