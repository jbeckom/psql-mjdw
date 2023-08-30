create table sagitta.audit_payees (
     sagitem                                    text            not null 
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
    ,old_payee_name                             text            null 
    ,new_payee_name                             text            null 
    ,old_initial_dt                             text            null 
    ,new_initial_dt                             text            null 
    ,old_contact_name                           text            null 
    ,new_contact_name                           text            null 
    ,old_addr_1                                 text            null 
    ,new_addr_1                                 text            null 
    ,old_addr_2                                 text            null 
    ,new_addr_2                                 text            null 
    ,old_postal_code                            text            null 
    ,new_postal_code                            text            null 
    ,old_postal_extension_code                  text            null 
    ,new_postal_extension_code                  text            null 
    ,old_city                                   text            null 
    ,new_city                                   text            null 
    ,old_state_prov_cd                          text            null 
    ,new_state_prov_cd                          text            null 
    ,old_phone_1_number                         text            null 
    ,new_phone_1_number                         text            null 
    ,old_phone_2_number                         text            null 
    ,new_phone_2_number                         text            null 
    ,old_agency_cd                              text            null 
    ,new_agency_cd                              text            null 
    ,old_pay_method_cd                          text            null 
    ,new_pay_method_cd                          text            null 
    ,old_num_days                               text            null 
    ,new_num_days                               text            null 
    ,old_fax_number                             text            null 
    ,new_fax_number                             text            null 
    ,old_phone_1_extention_number               text            null 
    ,new_phone_1_extention_number               text            null 
    ,old_phone_2_extention_number               text            null 
    ,new_phone_2_extention_number               text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,old_direct_bill_ind                        text            null 
    ,new_direct_bill_ind                        text            null 
    ,old_release_ind                            text            null 
    ,new_release_ind                            text            null 
    ,old_email_addr                             text            null 
    ,new_email_addr                             text            null 
    ,old_description                            text            null 
    ,new_description                            text            null 
    ,old_mga                                    text            null 
    ,new_mga                                    text            null 
    ,old_global                                 text            null 
    ,new_global                                 text            null 
    ,old_payee_responsible_for_filing           text            null 
    ,new_payee_responsible_for_filing           text            null 
    ,old_tax_fee_payee                          text            null 
    ,new_tax_fee_payee                          text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_payees owner to mj_admin;
go 

grant insert on sagitta.audit_payees to rl_sagitta_a;
go 