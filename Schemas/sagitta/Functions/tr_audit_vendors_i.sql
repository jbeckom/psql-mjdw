create or replace function sagitta.tr_audit_vendors_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_vendors (
         sagitem 
        ,new_audit_staff_cd 
        ,new_audit_entry_dt 
        ,new_audit_time 
        ,new_audit_cd 
        ,new_audit_history_record_number 
        ,new_audit_program 
        ,new_vendor_name_1 
        ,new_vendor_name_2 
        ,new_vendor_addr_1 
        ,new_vendor_addr_2 
        ,new_postal_code 
        ,new_postal_extension_code 
        ,new_vendor_city 
        ,new_vendor_state 
        ,new_vendor_phone_number 
        ,new_vendor_fax_number 
        ,new_vendor_tax_id 
        ,new_vendor_require_1099_ind 
        ,new_vendor_credit_term 
        ,new_vendor_status 
        ,new_vendor_contact_name 
        ,new_bank_cd 
        ,new_vendor_type_cd 
        ,new_voucher_print_ind 
        ,new_insurer_ap_void_ind 
        ,new_vendor_off_dt 
        ,new_vendor_off_dt_remark_text 
        ,new_insurer_db_rec_ind 
        ,new_producer_db_pay_ind 
        ,new_vendor_print_gl_number 
        ,new_ins_db_method 
        ,new_vendor_igl_ind 
        ,new_producer_ab_pay_ind 
        ,new_broker 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.audit_staff_cd 
            ,new.audit_entry_dt 
            ,new.audit_time 
            ,new.audit_cd 
            ,new.audit_history_record_number 
            ,new.audit_program 
            ,new.vendor_name_1 
            ,new.vendor_name_2 
            ,new.vendor_addr_1 
            ,new.vendor_addr_2 
            ,new.postal_code 
            ,new.postal_extension_code 
            ,new.vendor_city 
            ,new.vendor_state 
            ,new.vendor_phone_number 
            ,new.vendor_fax_number 
            ,new.vendor_tax_id 
            ,new.vendor_require_1099_ind 
            ,new.vendor_credit_term 
            ,new.vendor_status 
            ,new.vendor_contact_name 
            ,new.bank_cd 
            ,new.vendor_type_cd 
            ,new.voucher_print_ind 
            ,new.insurer_ap_void_ind 
            ,new.vendor_off_dt 
            ,new.vendor_off_dt_remark_text 
            ,new.insurer_db_rec_ind 
            ,new.producer_db_pay_ind 
            ,new.vendor_print_gl_number 
            ,new.ins_db_method 
            ,new.vendor_igl_ind 
            ,new.producer_ab_pay_ind 
            ,new.broker 
            ,'I';
    return new; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_vendors_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_vendors_i() to rl_sagitta_x;
go 