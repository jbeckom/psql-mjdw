create or replace function sagitta.sp_ol_coverages_coverage_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.ol_coverages_coverage_info (
         sagitem 
        ,lis 
        ,coverage_cd
        ,state_prov_cd
        ,location_number
        ,building_number
        ,form_number
        ,addl_cov_edition_dt
        ,rate
        ,co_insurance
        ,premium_amt
        ,limit_1
        ,limit_1_desc_code
        ,deductible_1
        ,ded_symbol_1
        ,deductible_basis_cd_1
        ,deductible_type_cd_1
        ,limit_2
        ,limit_2_desc_code
        ,deductible_2
        ,ded_symbol_2
        ,deductible_basis_cd_2
        ,deductible_type_cd_2
        ,exposure_1
        ,territory
        ,coverage_desc
        ,addl_info_ind
        ,vehicle_no
        ,rating_basis
        ,valuation_code_1
        ,valuation_code_2
        ,cause_of_loss
        ,cov_effective_date
        ,cov_expiration_date
        ,exposure_1basis
        ,exposure_2
        ,exposure_2basis
        ,cov_type_code 
    )
    select   sagitem 
            ,lis 
            ,coverage_cd
            ,state_prov_cd
            ,location_number
            ,building_number
            ,form_number
            ,addl_cov_edition_dt
            ,rate
            ,co_insurance
            ,premium_amt
            ,limit_1
            ,limit_1_desc_code
            ,deductible_1
            ,ded_symbol_1
            ,deductible_basis_cd_1
            ,deductible_type_cd_1
            ,limit_2
            ,limit_2_desc_code
            ,deductible_2
            ,ded_symbol_2
            ,deductible_basis_cd_2
            ,deductible_type_cd_2
            ,exposure_1
            ,territory
            ,coverage_desc
            ,addl_info_ind
            ,vehicle_no
            ,rating_basis
            ,valuation_code_1
            ,valuation_code_2
            ,cause_of_loss
            ,cov_effective_date
            ,cov_expiration_date
            ,exposure_1basis
            ,exposure_2
            ,exposure_2basis
            ,cov_type_code 
    from    sagitta.stg_ol_coverages_coverage_info 
    on conflict (sagitem,lis) do update 
    set      coverage_cd            = excluded.coverage_cd
            ,state_prov_cd          = excluded.state_prov_cd
            ,location_number        = excluded.location_number
            ,building_number        = excluded.building_number
            ,form_number            = excluded.form_number
            ,addl_cov_edition_dt    = excluded.addl_cov_edition_dt
            ,rate                   = excluded.rate
            ,co_insurance           = excluded.co_insurance
            ,premium_amt            = excluded.premium_amt
            ,limit_1                = excluded.limit_1
            ,limit_1_desc_code      = excluded.limit_1_desc_code
            ,deductible_1           = excluded.deductible_1
            ,ded_symbol_1           = excluded.ded_symbol_1
            ,deductible_basis_cd_1  = excluded.deductible_basis_cd_1
            ,deductible_type_cd_1   = excluded.deductible_type_cd_1
            ,limit_2                = excluded.limit_2
            ,limit_2_desc_code      = excluded.limit_2_desc_code
            ,deductible_2           = excluded.deductible_2
            ,ded_symbol_2           = excluded.ded_symbol_2
            ,deductible_basis_cd_2  = excluded.deductible_basis_cd_2
            ,deductible_type_cd_2   = excluded.deductible_type_cd_2
            ,exposure_1             = excluded.exposure_1
            ,territory              = excluded.territory
            ,coverage_desc          = excluded.coverage_desc
            ,addl_info_ind          = excluded.addl_info_ind
            ,vehicle_no             = excluded.vehicle_no
            ,rating_basis           = excluded.rating_basis
            ,valuation_code_1       = excluded.valuation_code_1
            ,valuation_code_2       = excluded.valuation_code_2
            ,cause_of_loss          = excluded.cause_of_loss
            ,cov_effective_date     = excluded.cov_effective_date
            ,cov_expiration_date    = excluded.cov_expiration_date
            ,exposure_1basis        = excluded.exposure_1basis
            ,exposure_2             = excluded.exposure_2
            ,exposure_2basis        = excluded.exposure_2basis
            ,cov_type_code          = excluded.cov_type_code
    where   (ol_coverages_coverage_info.coverage_cd,ol_coverages_coverage_info.state_prov_cd,ol_coverages_coverage_info.location_number,ol_coverages_coverage_info.building_number,ol_coverages_coverage_info.form_number,ol_coverages_coverage_info.addl_cov_edition_dt,ol_coverages_coverage_info.rate,ol_coverages_coverage_info.co_insurance,ol_coverages_coverage_info.premium_amt,ol_coverages_coverage_info.limit_1,ol_coverages_coverage_info.limit_1_desc_code,ol_coverages_coverage_info.deductible_1,ol_coverages_coverage_info.ded_symbol_1,ol_coverages_coverage_info.deductible_basis_cd_1,ol_coverages_coverage_info.deductible_type_cd_1,ol_coverages_coverage_info.limit_2,ol_coverages_coverage_info.limit_2_desc_code,ol_coverages_coverage_info.deductible_2,ol_coverages_coverage_info.ded_symbol_2,ol_coverages_coverage_info.deductible_basis_cd_2,ol_coverages_coverage_info.deductible_type_cd_2,ol_coverages_coverage_info.exposure_1,ol_coverages_coverage_info.territory,ol_coverages_coverage_info.coverage_desc,ol_coverages_coverage_info.addl_info_ind,ol_coverages_coverage_info.vehicle_no,ol_coverages_coverage_info.rating_basis,ol_coverages_coverage_info.valuation_code_1,ol_coverages_coverage_info.valuation_code_2,ol_coverages_coverage_info.cause_of_loss,ol_coverages_coverage_info.cov_effective_date,ol_coverages_coverage_info.cov_expiration_date,ol_coverages_coverage_info.exposure_1basis,ol_coverages_coverage_info.exposure_2,ol_coverages_coverage_info.exposure_2basis,ol_coverages_coverage_info.cov_type_code) 
        is distinct from    (excluded.coverage_cd,excluded.state_prov_cd,excluded.location_number,excluded.building_number,excluded.form_number,excluded.addl_cov_edition_dt,excluded.rate,excluded.co_insurance,excluded.premium_amt,excluded.limit_1,excluded.limit_1_desc_code,excluded.deductible_1,excluded.ded_symbol_1,excluded.deductible_basis_cd_1,excluded.deductible_type_cd_1,excluded.limit_2,excluded.limit_2_desc_code,excluded.deductible_2,excluded.ded_symbol_2,excluded.deductible_basis_cd_2,excluded.deductible_type_cd_2,excluded.exposure_1,excluded.territory,excluded.coverage_desc,excluded.addl_info_ind,excluded.vehicle_no,excluded.rating_basis,excluded.valuation_code_1,excluded.valuation_code_2,excluded.cause_of_loss,excluded.cov_effective_date,excluded.cov_expiration_date,excluded.exposure_1basis,excluded.exposure_2,excluded.exposure_2basis,excluded.cov_type_code); 

    get diagnostics rc = row_count;

    return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_ol_coverages_coverage_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_ol_coverages_coverage_info_upsert() to rl_sagitta_x;
go 