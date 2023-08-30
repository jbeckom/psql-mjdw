create table sagitta.audit_ol_coverages_coverage_info(
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,old_coverage_cd                    text            null 
    ,new_coverage_cd                    text            null 
    ,old_state_prov_cd                  text            null 
    ,new_state_prov_cd                  text            null 
    ,old_location_number                text            null 
    ,new_location_number                text            null 
    ,old_building_number                text            null 
    ,new_building_number                text            null 
    ,old_form_number                    text            null 
    ,new_form_number                    text            null 
    ,old_addl_cov_edition_dt            text            null 
    ,new_addl_cov_edition_dt            text            null 
    ,old_rate                           text            null 
    ,new_rate                           text            null 
    ,old_co_insurance                   text            null 
    ,new_co_insurance                   text            null 
    ,old_premium_amt                    text            null 
    ,new_premium_amt                    text            null 
    ,old_limit_1                        text            null 
    ,new_limit_1                        text            null 
    ,old_limit_1_desc_code              text            null 
    ,new_limit_1_desc_code              text            null 
    ,old_deductible_1                   text            null 
    ,new_deductible_1                   text            null 
    ,old_ded_symbol_1                   text            null 
    ,new_ded_symbol_1                   text            null 
    ,old_deductible_basis_cd_1          text            null 
    ,new_deductible_basis_cd_1          text            null 
    ,old_deductible_type_cd_1           text            null 
    ,new_deductible_type_cd_1           text            null 
    ,old_limit_2                        text            null 
    ,new_limit_2                        text            null 
    ,old_limit_2_desc_code              text            null 
    ,new_limit_2_desc_code              text            null 
    ,old_deductible_2                   text            null 
    ,new_deductible_2                   text            null 
    ,old_ded_symbol_2                   text            null 
    ,new_ded_symbol_2                   text            null 
    ,old_deductible_basis_cd_2          text            null 
    ,new_deductible_basis_cd_2          text            null 
    ,old_deductible_type_cd_2           text            null 
    ,new_deductible_type_cd_2           text            null 
    ,old_exposure_1                     text            null 
    ,new_exposure_1                     text            null 
    ,old_territory                      text            null 
    ,new_territory                      text            null 
    ,old_coverage_desc                  text            null 
    ,new_coverage_desc                  text            null 
    ,old_addl_info_ind                  text            null 
    ,new_addl_info_ind                  text            null 
    ,old_vehicle_no                     text            null 
    ,new_vehicle_no                     text            null 
    ,old_rating_basis                   text            null 
    ,new_rating_basis                   text            null 
    ,old_valuation_code_1               text            null 
    ,new_valuation_code_1               text            null 
    ,old_valuation_code_2               text            null 
    ,new_valuation_code_2               text            null 
    ,old_cause_of_loss                  text            null 
    ,new_cause_of_loss                  text            null 
    ,old_cov_effective_date             text            null 
    ,new_cov_effective_date             text            null 
    ,old_cov_expiration_date            text            null 
    ,new_cov_expiration_date            text            null 
    ,old_exposure_1basis                text            null 
    ,new_exposure_1basis                text            null 
    ,old_exposure_2                     text            null 
    ,new_exposure_2                     text            null 
    ,old_exposure_2basis                text            null 
    ,new_exposure_2basis                text            null 
    ,old_cov_type_code                  text            null 
    ,new_cov_type_code                  text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_ol_coverages_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_ol_coverages_coverage_info to rl_sagitta_a;
go