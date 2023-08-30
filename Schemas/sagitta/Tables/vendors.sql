create table sagitta.vendors (
     sagitem                        text            not null 
    ,audit_staff_cd                 text            null 
    ,audit_entry_dt                 int             null 
    ,audit_time                     int             null 
    ,audit_cd                       text            null 
    ,audit_history_record_number    text            null 
    ,audit_program                  text            null 
    ,vendor_name_1                  text            null 
    ,vendor_name_2                  text            null 
    ,vendor_addr_1                  text            null 
    ,vendor_addr_2                  text            null 
    ,postal_code                    text            null 
    ,postal_extension_code          text            null 
    ,vendor_city                    text            null 
    ,vendor_state                   text            null 
    ,vendor_phone_number            text            null 
    ,vendor_fax_number              text            null 
    ,vendor_tax_id                  text            null 
    ,vendor_require_1099_ind        text            null 
    ,vendor_credit_term             text            null 
    ,vendor_status                  text            null 
    ,vendor_contact_name            text            null 
    ,bank_cd                        text            null 
    ,vendor_type_cd                 text            null 
    ,voucher_print_ind              text            null 
    ,insurer_ap_void_ind            text            null 
    ,vendor_off_dt                  text            null 
    ,vendor_off_dt_remark_text      text            null 
    ,insurer_db_rec_ind             text            null 
    ,producer_db_pay_ind            text            null 
    ,vendor_print_gl_number         text            null 
    ,ins_db_method                  text            null 
    ,vendor_igl_ind                 text            null 
    ,producer_ab_pay_ind            text            null 
    ,broker                         text            null 
    ,constraint vendors_pkey    primary key (sagitem)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.vendors owner to mj_admin;
go 

grant select on sagitta.vendors to rl_sagitta_r;
go 

grant insert on sagitta.vendors to rl_sagitta_a;
go 

grant update on sagitta.vendors to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.vendors for each row execute function sagitta.tr_audit_vendors_d();
go 

create trigger audit_i after insert on sagitta.vendors for each row execute function sagitta.tr_audit_vendors_i();
go 

create trigger audit_u after update on sagitta.vendors for each row when (old is distinct from new) execute function sagitta.tr_audit_vendors_u();
go 