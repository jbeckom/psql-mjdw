create or replace function sagitta.tr_audit_gs_coverages_d()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages (
         sagitem 
        ,old_audit_staff_cd
        ,old_audit_entry_dt
        ,old_audit_time
        ,old_audit_cd
        ,old_audit_history_record_number
        ,old_audit_program
        ,old_audit_effective_dt
        ,old_audit_change_agency_id
        ,old_policy_agency_id
        ,old_glass_deductible
        ,old_glass_retention_pct
        ,old_large_glass_option_ind
        ,old_sign_full_form_coverage_ind
        ,old_sign_deductible_clause_ind
        ,old_off_dt
        ,old_lis_count_glass_info
        ,old_lis_count_sign_item_info
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
            ,old.policy_agency_id
            ,old.glass_deductible
            ,old.glass_retention_pct
            ,old.large_glass_option_ind
            ,old.sign_full_form_coverage_ind
            ,old.sign_deductible_clause_ind
            ,old.off_dt
            ,old.lis_count_glass_info
            ,old.lis_count_sign_item_info
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_d() to rl_sagitta_x;
go 
