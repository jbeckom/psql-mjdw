create or replace function sagitta.tr_audit_ol_coverages_coverage_info_d() 
returns trigger 
language plpgsql 
as $$ 

BEGIN
    insert into sagitta.audit_ol_coverages_coverage_info (
         sagitem 
        ,lis 
        ,old_coverage_cd
        ,old_state_prov_cd
        ,old_location_number
        ,old_building_number
        ,old_form_number
        ,old_addl_cov_edition_dt
        ,old_rate
        ,old_co_insurance
        ,old_premium_amt
        ,old_limit_1
        ,old_limit_1_desc_code
        ,old_deductible_1
        ,old_ded_symbol_1
        ,old_deductible_basis_cd_1
        ,old_deductible_type_cd_1
        ,old_limit_2
        ,old_limit_2_desc_code
        ,old_deductible_2
        ,old_ded_symbol_2
        ,old_deductible_basis_cd_2
        ,old_deductible_type_cd_2
        ,old_exposure_1
        ,old_territory
        ,old_coverage_desc
        ,old_addl_info_ind
        ,old_vehicle_no
        ,old_rating_basis
        ,old_valuation_code_1
        ,old_valuation_code_2
        ,old_cause_of_loss
        ,old_cov_effective_date
        ,old_cov_expiration_date
        ,old_exposure_1basis
        ,old_exposure_2
        ,old_exposure_2basis
        ,old_cov_type_code 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.coverage_cd
            ,old.state_prov_cd
            ,old.location_number
            ,old.building_number
            ,old.form_number
            ,old.addl_cov_edition_dt
            ,old.rate
            ,old.co_insurance
            ,old.premium_amt
            ,old.limit_1
            ,old.limit_1_desc_code
            ,old.deductible_1
            ,old.ded_symbol_1
            ,old.deductible_basis_cd_1
            ,old.deductible_type_cd_1
            ,old.limit_2
            ,old.limit_2_desc_code
            ,old.deductible_2
            ,old.ded_symbol_2
            ,old.deductible_basis_cd_2
            ,old.deductible_type_cd_2
            ,old.exposure_1
            ,old.territory
            ,old.coverage_desc
            ,old.addl_info_ind
            ,old.vehicle_no
            ,old.rating_basis
            ,old.valuation_code_1
            ,old.valuation_code_2
            ,old.cause_of_loss
            ,old.cov_effective_date
            ,old.cov_expiration_date
            ,old.exposure_1basis
            ,old.exposure_2
            ,old.exposure_2basis
            ,old.cov_type_code 
            ,'D';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_coverage_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_coverage_info_d() to rl_sagitta_x;
go 