create or replace function sagitta.tr_audit_wc_coverages_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_wc_coverages (
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
        ,new_empl_liab_acc_limit
        ,new_disease_per_empl_limit
        ,new_disease_policy_limit
        ,new_empl_liab_premium_amt
        ,new_uslh_ind
        ,new_uslh_premium_amt
        ,new_voluntary_comp_ind
        ,new_voluntary_comp_premium_amt
        ,new_other_states_ind
        ,new_other_states_premium_amt
        ,new_excluded_states
        ,new_included_states
        ,new_off_dt
        ,new_rate
        ,new_statutory_limits_apply
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
            ,new.empl_liab_acc_limit
            ,new.disease_per_empl_limit
            ,new.disease_policy_limit
            ,new.empl_liab_premium_amt
            ,new.uslh_ind
            ,new.uslh_premium_amt
            ,new.voluntary_comp_ind
            ,new.voluntary_comp_premium_amt
            ,new.other_states_ind
            ,new.other_states_premium_amt
            ,new.excluded_states
            ,new.included_states
            ,new.off_dt
            ,new.rate
            ,new.statutory_limits_apply
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_wc_coverages_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_wc_coverages_i() to rl_sagitta_x;
go 