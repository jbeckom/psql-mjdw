create or replace function sagitta.tr_audit_company_master_i() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_company_master (
         sagitem 
        ,new_audit_staff_cd 
        ,new_audit_entry_dt 
        ,new_audit_time 
        ,new_audit_cd 
        ,new_audit_history_record_number 
        ,new_audit_program 
        ,new_division_name 
        ,new_addr_1 
        ,new_addr_2 
        ,new_postal_code 
        ,new_postal_extension_code 
        ,new_phone_1_number 
        ,new_phone_2_number 
        ,new_gl_format 
        ,new_division_gl_suspense_acct 
        ,new_prefill_acord_forms_yn_cd 
        ,new_fax_number 
        ,new_ny_license_code 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.audit_staff_cd 
            ,new.audit_entry_dt 
            ,new.audit_time 
            ,new.audit_cd 
            ,new.audit_history_record_number 
            ,new.audit_program 
            ,new.division_name 
            ,new.addr_1 
            ,new.addr_2 
            ,new.postal_code 
            ,new.postal_extension_code 
            ,new.phone_1_number 
            ,new.phone_2_number 
            ,new.gl_format 
            ,new.division_gl_suspense_acct 
            ,new.prefill_acord_forms_yn_cd 
            ,new.fax_number 
            ,new.ny_license_code 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_company_master_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_company_master_i() to rl_sagitta_x;
go 