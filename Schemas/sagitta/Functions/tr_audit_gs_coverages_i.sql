create or replace function sagitta.tr_audit_gs_coverages_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages (
         sagitem 
        ,new_audit_staff_cd
        ,new_audit_entry_dt
        ,new_audit_time
        ,new_audit_cd
        ,new_audit_history_record_number
        ,new_audit_program
        ,new_audit_effective_dt
        ,new_audit_change_agency_id
        ,new_policy_agency_id
        ,new_glass_deductible
        ,new_glass_retention_pct
        ,new_large_glass_option_ind
        ,new_sign_full_form_coverage_ind
        ,new_sign_deductible_clause_ind
        ,new_off_dt
        ,new_lis_count_glass_info
        ,new_lis_count_sign_item_info
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
            ,new.policy_agency_id
            ,new.glass_deductible
            ,new.glass_retention_pct
            ,new.large_glass_option_ind
            ,new.sign_full_form_coverage_ind
            ,new.sign_deductible_clause_ind
            ,new.off_dt
            ,new.lis_count_glass_info
            ,new.lis_count_sign_item_info
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_i() to rl_sagitta_x;
go 
