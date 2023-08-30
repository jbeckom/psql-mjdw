create or replace function sagitta.tr_audit_ol_coverages_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_ol_coverages (
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
        ,new_lob_cd
        ,new_lob_desc
        ,new_rating_basis
        ,new_valuation_code_1
        ,new_valuation_code_2
        ,new_cause_of_loss
        ,new_cov_effective_date
        ,new_cov_expiration_date
        ,new_number_of_1_desc
        ,new_number_of_2
        ,new_number_of_2_desc
        ,new_off_dt
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
            ,new.lob_cd
            ,new.lob_desc
            ,new.rating_basis
            ,new.valuation_code_1
            ,new.valuation_code_2
            ,new.cause_of_loss
            ,new.cov_effective_date
            ,new.cov_expiration_date
            ,new.number_of_1_desc
            ,new.number_of_2
            ,new.number_of_2_desc
            ,new.off_dt
            ,'I';
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_i() to rl_sagitta_x;
go 