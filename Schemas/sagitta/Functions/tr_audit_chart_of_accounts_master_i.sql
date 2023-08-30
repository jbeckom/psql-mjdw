create or replace function sagitta.tr_audit_chart_of_accounts_master_i() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into sagitta.audit_chart_of_accounts_master (
         sagitem 
        ,new_audit_staff_cd 
        ,new_audit_entry_dt 
        ,new_audit_time 
        ,new_audit_cd 
        ,new_audit_history_record_number 
        ,new_audit_program 
        ,new_audit_effective_dt 
        ,new_audit_change_agency_id 
        ,new_description 
        ,new_normal_balance_amt 
        ,new_ledger_type_cd 
        ,new_period_end_dt 
        ,new_close_to_account 
        ,new_report_cd 
        ,new_base_pct 
        ,new_allocated_by 
        ,new_gl_account_number 
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
            ,new.audit_change_agency_id 
            ,new.description 
            ,new.normal_balance_amt 
            ,new.ledger_type_cd 
            ,new.period_end_dt 
            ,new.close_to_account 
            ,new.report_cd 
            ,new.base_pct 
            ,new.allocated_by 
            ,new.gl_account_number 
            ,'I';
    return new; 
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_chart_of_accounts_master_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_chart_of_accounts_master_i() to rl_sagitta_x;
go 