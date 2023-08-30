create or replace function sagitta.tr_audit_chart_of_accounts_master_u() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_chart_of_accounts_master (
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
        ,old_audit_effective_dt 
        ,new_audit_effective_dt 
        ,old_audit_change_agency_id 
        ,new_audit_change_agency_id 
        ,old_description 
        ,new_description 
        ,old_normal_balance_amt 
        ,new_normal_balance_amt 
        ,old_ledger_type_cd 
        ,new_ledger_type_cd 
        ,old_period_end_dt 
        ,new_period_end_dt 
        ,old_close_to_account 
        ,new_close_to_account 
        ,old_report_cd 
        ,new_report_cd 
        ,old_base_pct 
        ,new_base_pct 
        ,old_allocated_by 
        ,new_allocated_by 
        ,old_gl_account_number 
        ,new_gl_account_number 
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
            ,old.audit_effective_dt 
            ,new.audit_effective_dt 
            ,old.audit_change_agency_id 
            ,new.audit_change_agency_id 
            ,old.description 
            ,new.description 
            ,old.normal_balance_amt 
            ,new.normal_balance_amt 
            ,old.ledger_type_cd 
            ,new.ledger_type_cd 
            ,old.period_end_dt 
            ,new.period_end_dt 
            ,old.close_to_account 
            ,new.close_to_account 
            ,old.report_cd 
            ,new.report_cd 
            ,old.base_pct 
            ,new.base_pct 
            ,old.allocated_by 
            ,new.allocated_by 
            ,old.gl_account_number 
            ,new.gl_account_number 
            ,'U';
    return old; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_u() to rl_sagitta_x;
go 