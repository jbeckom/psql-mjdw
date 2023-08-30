create or replace function sagitta.tr_audit_company_master_u() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_company_master (
         sagitem 
        ,old_audit_staff_cd 
        ,new_audit_staff_cd 
        ,old_audit_entry_dt 
        ,new_audit_entry_dt 
        ,old_audit_time 
        ,new_audit_time 
        ,old_audit_cd 
        ,new_audit_cd 
        ,old_audit_history_record_number 
        ,new_audit_history_record_number 
        ,old_audit_program 
        ,new_audit_program 
        ,old_division_name 
        ,new_division_name 
        ,old_addr_1 
        ,new_addr_1 
        ,old_addr_2 
        ,new_addr_2 
        ,old_postal_code 
        ,new_postal_code 
        ,old_postal_extension_code 
        ,new_postal_extension_code 
        ,old_phone_1_number 
        ,new_phone_1_number 
        ,old_phone_2_number 
        ,new_phone_2_number 
        ,old_gl_format 
        ,new_gl_format 
        ,old_division_gl_suspense_acct 
        ,new_division_gl_suspense_acct 
        ,old_prefill_acord_forms_yn_cd 
        ,new_prefill_acord_forms_yn_cd 
        ,old_fax_number 
        ,new_fax_number 
        ,old_ny_license_code 
        ,new_ny_license_code 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.audit_staff_cd 
            ,new.audit_staff_cd 
            ,old.audit_entry_dt 
            ,new.audit_entry_dt 
            ,old.audit_time 
            ,new.audit_time 
            ,old.audit_cd 
            ,new.audit_cd 
            ,old.audit_history_record_number 
            ,new.audit_history_record_number 
            ,old.audit_program 
            ,new.audit_program 
            ,old.division_name 
            ,new.division_name 
            ,old.addr_1 
            ,new.addr_1 
            ,old.addr_2 
            ,new.addr_2 
            ,old.postal_code 
            ,new.postal_code 
            ,old.postal_extension_code 
            ,new.postal_extension_code 
            ,old.phone_1_number 
            ,new.phone_1_number 
            ,old.phone_2_number 
            ,new.phone_2_number 
            ,old.gl_format 
            ,new.gl_format 
            ,old.division_gl_suspense_acct 
            ,new.division_gl_suspense_acct 
            ,old.prefill_acord_forms_yn_cd 
            ,new.prefill_acord_forms_yn_cd 
            ,old.fax_number 
            ,new.fax_number 
            ,old.ny_license_code 
            ,new.ny_license_code 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_company_master_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_company_master_u() to rl_sagitta_x;
go 