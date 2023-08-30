create or replace function sagitta.tr_audit_ol_coverages_coverage_info_i() 
returns trigger 
language plpgsql 
as $$ 

BEGIN
    insert into sagitta.audit_ol_coverages_coverage_info (
         sagitem 
        ,lis 
        ,new_coverage_cd
        ,new_state_prov_cd
        ,new_location_number
        ,new_building_number
        ,new_form_number
        ,new_addl_cov_edition_dt
        ,new_rate
        ,new_co_insurance
        ,new_premium_amt
        ,new_limit_1
        ,new_limit_1_desc_code
        ,new_deductible_1
        ,new_ded_symbol_1
        ,new_deductible_basis_cd_1
        ,new_deductible_type_cd_1
        ,new_limit_2
        ,new_limit_2_desc_code
        ,new_deductible_2
        ,new_ded_symbol_2
        ,new_deductible_basis_cd_2
        ,new_deductible_type_cd_2
        ,new_exposure_1
        ,new_territory
        ,new_coverage_desc
        ,new_addl_info_ind
        ,new_vehicle_no
        ,new_rating_basis
        ,new_valuation_code_1
        ,new_valuation_code_2
        ,new_cause_of_loss
        ,new_cov_effective_date
        ,new_cov_expiration_date
        ,new_exposure_1basis
        ,new_exposure_2
        ,new_exposure_2basis
        ,new_cov_type_code 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.coverage_cd
            ,new.state_prov_cd
            ,new.location_number
            ,new.building_number
            ,new.form_number
            ,new.addl_cov_edition_dt
            ,new.rate
            ,new.co_insurance
            ,new.premium_amt
            ,new.limit_1
            ,new.limit_1_desc_code
            ,new.deductible_1
            ,new.ded_symbol_1
            ,new.deductible_basis_cd_1
            ,new.deductible_type_cd_1
            ,new.limit_2
            ,new.limit_2_desc_code
            ,new.deductible_2
            ,new.ded_symbol_2
            ,new.deductible_basis_cd_2
            ,new.deductible_type_cd_2
            ,new.exposure_1
            ,new.territory
            ,new.coverage_desc
            ,new.addl_info_ind
            ,new.vehicle_no
            ,new.rating_basis
            ,new.valuation_code_1
            ,new.valuation_code_2
            ,new.cause_of_loss
            ,new.cov_effective_date
            ,new.cov_expiration_date
            ,new.exposure_1basis
            ,new.exposure_2
            ,new.exposure_2basis
            ,new.cov_type_code 
            ,'I';
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_ol_coverages_coverage_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_ol_coverages_coverage_info_i() to rl_sagitta_x;
go 