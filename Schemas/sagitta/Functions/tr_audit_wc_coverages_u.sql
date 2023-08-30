create or replace function sagitta.tr_audit_wc_coverages_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages (
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
        ,old_empl_liab_acc_limit
        ,new_empl_liab_acc_limit
        ,old_disease_per_empl_limit
        ,new_disease_per_empl_limit
        ,old_disease_policy_limit
        ,new_disease_policy_limit
        ,old_empl_liab_premium_amt
        ,new_empl_liab_premium_amt
        ,old_uslh_ind
        ,new_uslh_ind
        ,old_uslh_premium_amt
        ,new_uslh_premium_amt
        ,old_voluntary_comp_ind
        ,new_voluntary_comp_ind
        ,old_voluntary_comp_premium_amt
        ,new_voluntary_comp_premium_amt
        ,old_other_states_ind
        ,new_other_states_ind
        ,old_other_states_premium_amt
        ,new_other_states_premium_amt
        ,old_excluded_states
        ,new_excluded_states
        ,old_included_states
        ,new_included_states
        ,old_off_dt
        ,new_off_dt
        ,old_rate
        ,new_rate
        ,old_statutory_limits_apply
        ,new_statutory_limits_apply
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
            ,old.empl_liab_acc_limit
            ,new.empl_liab_acc_limit
            ,old.disease_per_empl_limit
            ,new.disease_per_empl_limit
            ,old.disease_policy_limit
            ,new.disease_policy_limit
            ,old.empl_liab_premium_amt
            ,new.empl_liab_premium_amt
            ,old.uslh_ind
            ,new.uslh_ind
            ,old.uslh_premium_amt
            ,new.uslh_premium_amt
            ,old.voluntary_comp_ind
            ,new.voluntary_comp_ind
            ,old.voluntary_comp_premium_amt
            ,new.voluntary_comp_premium_amt
            ,old.other_states_ind
            ,new.other_states_ind
            ,old.other_states_premium_amt
            ,new.other_states_premium_amt
            ,old.excluded_states
            ,new.excluded_states
            ,old.included_states
            ,new.included_states
            ,old.off_dt
            ,new.off_dt
            ,old.rate
            ,new.rate
            ,old.statutory_limits_apply
            ,new.statutory_limits_apply
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_u() to rl_sagitta_x;
go 