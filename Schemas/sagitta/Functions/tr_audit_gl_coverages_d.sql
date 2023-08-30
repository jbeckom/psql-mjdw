create or replace function sagitta.tr_audit_gl_coverages_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gl_coverages (
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
        ,old_general_liab_ind
        ,old_claims_made_ind
        ,old_claims_occurrence_ind
        ,old_other_coverage_premium
        ,old_per_claim_ind
        ,old_per_occurrence_ind
        ,old_ded_basis_cd
        ,old_deductible
        ,old_gen_aggregate
        ,old_product_completed_ops_info
        ,old_pers_advertising_injury
        ,old_each_occurrence
        ,old_fire_legal
        ,old_medical_expense
        ,old_premises_operation
        ,old_products_premium_amt
        ,old_total_premium_amt
        ,old_off_dt
        ,old_total_other_cov_premium_amt
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
            ,old.general_liab_ind
            ,old.claims_made_ind
            ,old.claims_occurrence_ind
            ,old.other_coverage_premium
            ,old.per_claim_ind
            ,old.per_occurrence_ind
            ,old.ded_basis_cd
            ,old.deductible
            ,old.gen_aggregate
            ,old.product_completed_ops_info
            ,old.pers_advertising_injury
            ,old.each_occurrence
            ,old.fire_legal
            ,old.medical_expense
            ,old.premises_operation
            ,old.products_premium_amt
            ,old.total_premium_amt
            ,old.off_dt
            ,old.total_other_cov_premium_amt
            ,'D'; 
    return old;
end; 
$$; 
go 