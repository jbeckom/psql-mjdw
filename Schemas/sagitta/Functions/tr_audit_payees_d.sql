create or replace function sagitta.tr_audit_payees_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees (
         sagitem 
        ,old_audit_staff_cd
        ,old_audit_entry_dt
        ,old_audit_time
        ,old_audit_cd
        ,old_audit_history_record_number
        ,old_audit_program
        ,old_audit_effective_dt
        ,old_payee_name
        ,old_initial_dt
        ,old_contact_name
        ,old_addr_1
        ,old_addr_2
        ,old_postal_code
        ,old_postal_extension_code
        ,old_city
        ,old_state_prov_cd
        ,old_phone_1_number
        ,old_phone_2_number
        ,old_agency_cd
        ,old_pay_method_cd
        ,old_num_days
        ,old_fax_number
        ,old_phone_1_extention_number
        ,old_phone_2_extention_number
        ,old_off_dt
        ,old_direct_bill_ind
        ,old_release_ind
        ,old_email_addr
        ,old_description
        ,old_mga
        ,old_global
        ,old_payee_responsible_for_filing
        ,old_tax_fee_payee 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.audit_staff_cd
            ,old.audit_entry_dt
            ,old.audit_time
            ,old.audit_cd
            ,old.audit_history_record_number
            ,old.audit_program
            ,old.audit_effective_dt
            ,old.payee_name
            ,old.initial_dt
            ,old.contact_name
            ,old.addr_1
            ,old.addr_2
            ,old.postal_code
            ,old.postal_extension_code
            ,old.city
            ,old.state_prov_cd
            ,old.phone_1_number
            ,old.phone_2_number
            ,old.agency_cd
            ,old.pay_method_cd
            ,old.num_days
            ,old.fax_number
            ,old.phone_1_extention_number
            ,old.phone_2_extention_number
            ,old.off_dt
            ,old.direct_bill_ind
            ,old.release_ind
            ,old.email_addr
            ,old.description
            ,old.mga
            ,old.global
            ,old.payee_responsible_for_filing
            ,old.tax_fee_payee 
            ,'D' ;
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_d() to rl_sagitta_x;
go 
