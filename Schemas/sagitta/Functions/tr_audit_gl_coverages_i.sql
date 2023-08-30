create or replace function sagitta.tr_audit_gl_coverages_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages (
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
        ,new_general_liab_ind
        ,new_claims_made_ind
        ,new_claims_occurrence_ind
        ,new_other_coverage_premium
        ,new_per_claim_ind
        ,new_per_occurrence_ind
        ,new_ded_basis_cd
        ,new_deductible
        ,new_gen_aggregate
        ,new_product_completed_ops_info
        ,new_pers_advertising_injury
        ,new_each_occurrence
        ,new_fire_legal
        ,new_medical_expense
        ,new_premises_operation
        ,new_products_premium_amt
        ,new_total_premium_amt
        ,new_off_dt
        ,new_total_other_cov_premium_amt
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
            ,new.general_liab_ind
            ,new.claims_made_ind
            ,new.claims_occurrence_ind
            ,new.other_coverage_premium
            ,new.per_claim_ind
            ,new.per_occurrence_ind
            ,new.ded_basis_cd
            ,new.deductible
            ,new.gen_aggregate
            ,new.product_completed_ops_info
            ,new.pers_advertising_injury
            ,new.each_occurrence
            ,new.fire_legal
            ,new.medical_expense
            ,new.premises_operation
            ,new.products_premium_amt
            ,new.total_premium_amt
            ,new.off_dt
            ,new.total_other_cov_premium_amt
            ,'I'; 
    return new;
end; 
$$; 
go 