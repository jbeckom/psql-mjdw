create or replace function sagitta.tr_audit_ol_coverages_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_ol_coverages (
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
        ,old_lob_cd
        ,old_lob_desc
        ,old_rating_basis
        ,old_valuation_code_1
        ,old_valuation_code_2
        ,old_cause_of_loss
        ,old_cov_effective_date
        ,old_cov_expiration_date
        ,old_number_of_1_desc
        ,old_number_of_2
        ,old_number_of_2_desc
        ,old_off_dt
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
            ,old.lob_cd
            ,old.lob_desc
            ,old.rating_basis
            ,old.valuation_code_1
            ,old.valuation_code_2
            ,old.cause_of_loss
            ,old.cov_effective_date
            ,old.cov_expiration_date
            ,old.number_of_1_desc
            ,old.number_of_2
            ,old.number_of_2_desc
            ,old.off_dt
            ,'D';
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_d() to rl_sagitta_x;
go 