create or replace function sagitta.tr_audit_gs_coverages_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages (
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
        ,old_policy_agency_id
        ,new_policy_agency_id
        ,old_glass_deductible
        ,new_glass_deductible
        ,old_glass_retention_pct
        ,new_glass_retention_pct
        ,old_large_glass_option_ind
        ,new_large_glass_option_ind
        ,old_sign_full_form_coverage_ind
        ,new_sign_full_form_coverage_ind
        ,old_sign_deductible_clause_ind
        ,new_sign_deductible_clause_ind
        ,old_off_dt
        ,new_off_dt
        ,old_lis_count_glass_info
        ,new_lis_count_glass_info
        ,old_lis_count_sign_item_info
        ,new_lis_count_sign_item_info
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
            ,old.policy_agency_id
            ,new.policy_agency_id
            ,old.glass_deductible
            ,new.glass_deductible
            ,old.glass_retention_pct
            ,new.glass_retention_pct
            ,old.large_glass_option_ind
            ,new.large_glass_option_ind
            ,old.sign_full_form_coverage_ind
            ,new.sign_full_form_coverage_ind
            ,old.sign_deductible_clause_ind
            ,new.sign_deductible_clause_ind
            ,old.off_dt
            ,new.off_dt
            ,old.lis_count_glass_info
            ,new.lis_count_glass_info
            ,old.lis_count_sign_item_info
            ,new.lis_count_sign_item_info
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_u() to rl_sagitta_x;
go 
