create or replace function sagitta.tr_audit_payees_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_payees (
         sagitem 
        ,new_audit_staff_cd
        ,new_audit_entry_dt
        ,new_audit_time
        ,new_audit_cd
        ,new_audit_history_record_number
        ,new_audit_program
        ,new_audit_effective_dt
        ,new_payee_name
        ,new_initial_dt
        ,new_contact_name
        ,new_addr_1
        ,new_addr_2
        ,new_postal_code
        ,new_postal_extension_code
        ,new_city
        ,new_state_prov_cd
        ,new_phone_1_number
        ,new_phone_2_number
        ,new_agency_cd
        ,new_pay_method_cd
        ,new_num_days
        ,new_fax_number
        ,new_phone_1_extention_number
        ,new_phone_2_extention_number
        ,new_off_dt
        ,new_direct_bill_ind
        ,new_release_ind
        ,new_email_addr
        ,new_description
        ,new_mga
        ,new_global
        ,new_payee_responsible_for_filing
        ,new_tax_fee_payee 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.audit_staff_cd
            ,new.audit_entry_dt
            ,new.audit_time
            ,new.audit_cd
            ,new.audit_history_record_number
            ,new.audit_program
            ,new.audit_effective_dt
            ,new.payee_name
            ,new.initial_dt
            ,new.contact_name
            ,new.addr_1
            ,new.addr_2
            ,new.postal_code
            ,new.postal_extension_code
            ,new.city
            ,new.state_prov_cd
            ,new.phone_1_number
            ,new.phone_2_number
            ,new.agency_cd
            ,new.pay_method_cd
            ,new.num_days
            ,new.fax_number
            ,new.phone_1_extention_number
            ,new.phone_2_extention_number
            ,new.off_dt
            ,new.direct_bill_ind
            ,new.release_ind
            ,new.email_addr
            ,new.description
            ,new.mga
            ,new.global
            ,new.payee_responsible_for_filing
            ,new.tax_fee_payee 
            ,'I' ;
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_payees_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_payees_i() to rl_sagitta_x;
go 
