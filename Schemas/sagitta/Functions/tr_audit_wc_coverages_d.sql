create or replace function sagitta.tr_audit_wc_coverages_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages (
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
        ,old_empl_liab_acc_limit
        ,old_disease_per_empl_limit
        ,old_disease_policy_limit
        ,old_empl_liab_premium_amt
        ,old_uslh_ind
        ,old_uslh_premium_amt
        ,old_voluntary_comp_ind
        ,old_voluntary_comp_premium_amt
        ,old_other_states_ind
        ,old_other_states_premium_amt
        ,old_excluded_states
        ,old_included_states
        ,old_off_dt
        ,old_rate
        ,old_statutory_limits_apply
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
            ,old.empl_liab_acc_limit
            ,old.disease_per_empl_limit
            ,old.disease_policy_limit
            ,old.empl_liab_premium_amt
            ,old.uslh_ind
            ,old.uslh_premium_amt
            ,old.voluntary_comp_ind
            ,old.voluntary_comp_premium_amt
            ,old.other_states_ind
            ,old.other_states_premium_amt
            ,old.excluded_states
            ,old.included_states
            ,old.off_dt
            ,old.rate
            ,old.statutory_limits_apply
            ,'D';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_d() to rl_sagitta_x;
go 