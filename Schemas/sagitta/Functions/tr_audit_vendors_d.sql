create or replace function sagitta.tr_audit_vendors_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors (
         sagitem 
        ,old_audit_staff_cd 
        ,old_audit_entry_dt 
        ,old_audit_time 
        ,old_audit_cd 
        ,old_audit_history_record_number 
        ,old_audit_program 
        ,old_vendor_name_1 
        ,old_vendor_name_2 
        ,old_vendor_addr_1 
        ,old_vendor_addr_2 
        ,old_postal_code 
        ,old_postal_extension_code 
        ,old_vendor_city 
        ,old_vendor_state 
        ,old_vendor_phone_number 
        ,old_vendor_fax_number 
        ,old_vendor_tax_id 
        ,old_vendor_require_1099_ind 
        ,old_vendor_credit_term 
        ,old_vendor_status 
        ,old_vendor_contact_name 
        ,old_bank_cd 
        ,old_vendor_type_cd 
        ,old_voucher_print_ind 
        ,old_insurer_ap_void_ind 
        ,old_vendor_off_dt 
        ,old_vendor_off_dt_remark_text 
        ,old_insurer_db_rec_ind 
        ,old_producer_db_pay_ind 
        ,old_vendor_print_gl_number 
        ,old_ins_db_method 
        ,old_vendor_igl_ind 
        ,old_producer_ab_pay_ind 
        ,old_broker 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.audit_staff_cd 
            ,old.audit_entry_dt 
            ,old.audit_time 
            ,old.audit_cd 
            ,old.audit_history_record_number 
            ,old.audit_program 
            ,old.vendor_name_1 
            ,old.vendor_name_2 
            ,old.vendor_addr_1 
            ,old.vendor_addr_2 
            ,old.postal_code 
            ,old.postal_extension_code 
            ,old.vendor_city 
            ,old.vendor_state 
            ,old.vendor_phone_number 
            ,old.vendor_fax_number 
            ,old.vendor_tax_id 
            ,old.vendor_require_1099_ind 
            ,old.vendor_credit_term 
            ,old.vendor_status 
            ,old.vendor_contact_name 
            ,old.bank_cd 
            ,old.vendor_type_cd 
            ,old.voucher_print_ind 
            ,old.insurer_ap_void_ind 
            ,old.vendor_off_dt 
            ,old.vendor_off_dt_remark_text 
            ,old.insurer_db_rec_ind 
            ,old.producer_db_pay_ind 
            ,old.vendor_print_gl_number 
            ,old.ins_db_method 
            ,old.vendor_igl_ind 
            ,old.producer_ab_pay_ind 
            ,old.broker 
            ,'D';
    return old; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_d() to rl_sagitta_x;
go 