create or replace function sagitta.tr_audit_chart_of_accounts_master_d() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_chart_of_accounts_master (
         sagitem 
        ,old_audit_staff_cd 
        ,old_audit_entry_dt 
        ,old_audit_time 
        ,old_audit_cd 
        ,old_audit_history_record_number 
        ,old_audit_program 
        ,old_audit_effective_dt 
        ,old_audit_change_agency_id 
        ,old_description 
        ,old_normal_balance_amt 
        ,old_ledger_type_cd 
        ,old_period_end_dt 
        ,old_close_to_account 
        ,old_report_cd 
        ,old_base_pct 
        ,old_allocated_by 
        ,old_gl_account_number 
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
            ,old.audit_change_agency_id 
            ,old.description 
            ,old.normal_balance_amt 
            ,old.ledger_type_cd 
            ,old.period_end_dt 
            ,old.close_to_account 
            ,old.report_cd 
            ,old.base_pct 
            ,old.allocated_by 
            ,old.gl_account_number 
            ,'D';
    return old; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_d() to rl_sagitta_x;
go 