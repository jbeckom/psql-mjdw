create or replace function sagitta.tr_audit_gl_coverages_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages (
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
        ,old_general_liab_ind
        ,new_general_liab_ind
        ,old_claims_made_ind
        ,new_claims_made_ind
        ,old_claims_occurrence_ind
        ,new_claims_occurrence_ind
        ,old_other_coverage_premium
        ,new_other_coverage_premium
        ,old_per_claim_ind
        ,new_per_claim_ind
        ,old_per_occurrence_ind
        ,new_per_occurrence_ind
        ,old_ded_basis_cd
        ,new_ded_basis_cd
        ,old_deductible
        ,new_deductible
        ,old_gen_aggregate
        ,new_gen_aggregate
        ,old_product_completed_ops_info
        ,new_product_completed_ops_info
        ,old_pers_advertising_injury
        ,new_pers_advertising_injury
        ,old_each_occurrence
        ,new_each_occurrence
        ,old_fire_legal
        ,new_fire_legal
        ,old_medical_expense
        ,new_medical_expense
        ,old_premises_operation
        ,new_premises_operation
        ,old_products_premium_amt
        ,new_products_premium_amt
        ,old_total_premium_amt
        ,new_total_premium_amt
        ,old_off_dt
        ,new_off_dt
        ,old_total_other_cov_premium_amt
        ,new_total_other_cov_premium_amt
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
            ,old.general_liab_ind
            ,new.general_liab_ind
            ,old.claims_made_ind
            ,new.claims_made_ind
            ,old.claims_occurrence_ind
            ,new.claims_occurrence_ind
            ,old.other_coverage_premium
            ,new.other_coverage_premium
            ,old.per_claim_ind
            ,new.per_claim_ind
            ,old.per_occurrence_ind
            ,new.per_occurrence_ind
            ,old.ded_basis_cd
            ,new.ded_basis_cd
            ,old.deductible
            ,new.deductible
            ,old.gen_aggregate
            ,new.gen_aggregate
            ,old.product_completed_ops_info
            ,new.product_completed_ops_info
            ,old.pers_advertising_injury
            ,new.pers_advertising_injury
            ,old.each_occurrence
            ,new.each_occurrence
            ,old.fire_legal
            ,new.fire_legal
            ,old.medical_expense
            ,new.medical_expense
            ,old.premises_operation
            ,new.premises_operation
            ,old.products_premium_amt
            ,new.products_premium_amt
            ,old.total_premium_amt
            ,new.total_premium_amt
            ,old.off_dt
            ,new.off_dt
            ,old.total_other_cov_premium_amt
            ,new.total_other_cov_premium_amt
            ,'U'; 
    return old;
end; 
$$; 
go 