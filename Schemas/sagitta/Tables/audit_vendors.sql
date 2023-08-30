create table sagitta.audit_vendors (
     sagitem                            text            not null 
    ,old_audit_staff_cd                 text            null 
    ,new_audit_staff_cd                 text            null 
    ,old_audit_entry_dt                 int             null 
    ,new_audit_entry_dt                 int             null 
    ,old_audit_time                     int             null 
    ,new_audit_time                     int             null 
    ,old_audit_cd                       text            null 
    ,new_audit_cd                       text            null 
    ,old_audit_history_record_number    text            null 
    ,new_audit_history_record_number    text            null 
    ,old_audit_program                  text            null 
    ,new_audit_program                  text            null 
    ,old_vendor_name_1                  text            null 
    ,new_vendor_name_1                  text            null 
    ,old_vendor_name_2                  text            null 
    ,new_vendor_name_2                  text            null 
    ,old_vendor_addr_1                  text            null 
    ,new_vendor_addr_1                  text            null 
    ,old_vendor_addr_2                  text            null 
    ,new_vendor_addr_2                  text            null 
    ,old_postal_code                    text            null 
    ,new_postal_code                    text            null 
    ,old_postal_extension_code          text            null 
    ,new_postal_extension_code          text            null 
    ,old_vendor_city                    text            null 
    ,new_vendor_city                    text            null 
    ,old_vendor_state                   text            null 
    ,new_vendor_state                   text            null 
    ,old_vendor_phone_number            text            null 
    ,new_vendor_phone_number            text            null 
    ,old_vendor_fax_number              text            null 
    ,new_vendor_fax_number              text            null 
    ,old_vendor_tax_id                  text            null 
    ,new_vendor_tax_id                  text            null 
    ,old_vendor_require_1099_ind        text            null 
    ,new_vendor_require_1099_ind        text            null 
    ,old_vendor_credit_term             text            null 
    ,new_vendor_credit_term             text            null 
    ,old_vendor_status                  text            null 
    ,new_vendor_status                  text            null 
    ,old_vendor_contact_name            text            null 
    ,new_vendor_contact_name            text            null 
    ,old_bank_cd                        text            null 
    ,new_bank_cd                        text            null 
    ,old_vendor_type_cd                 text            null 
    ,new_vendor_type_cd                 text            null 
    ,old_voucher_print_ind              text            null 
    ,new_voucher_print_ind              text            null 
    ,old_insurer_ap_void_ind            text            null 
    ,new_insurer_ap_void_ind            text            null 
    ,old_vendor_off_dt                  text            null 
    ,new_vendor_off_dt                  text            null 
    ,old_vendor_off_dt_remark_text      text            null 
    ,new_vendor_off_dt_remark_text      text            null 
    ,old_insurer_db_rec_ind             text            null 
    ,new_insurer_db_rec_ind             text            null 
    ,old_producer_db_pay_ind            text            null 
    ,new_producer_db_pay_ind            text            null 
    ,old_vendor_print_gl_number         text            null 
    ,new_vendor_print_gl_number         text            null 
    ,old_ins_db_method                  text            null 
    ,new_ins_db_method                  text            null 
    ,old_vendor_igl_ind                 text            null 
    ,new_vendor_igl_ind                 text            null 
    ,old_producer_ab_pay_ind            text            null 
    ,new_producer_ab_pay_ind            text            null 
    ,old_broker                         text            null 
    ,new_broker                         text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_vendors owner to mj_admin;
go 

grant insert on sagitta.audit_vendors to rl_sagitta_a;
go 
