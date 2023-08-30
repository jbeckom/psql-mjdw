create table sagitta.audit_gd_coverages_additional_coverage_info (
     sagitem 													    int 			NOT NULL 
	,lis 														    int 			NOT NULL 
	,old_addl_coverage_cd                                           TEXT          NULL
    ,new_addl_coverage_cd                                           TEXT          NULL
    ,old_additional_state_coverage_info                             TEXT          NULL
    ,new_additional_state_coverage_info                             TEXT          NULL
    ,old_state_prov_cd                                              TEXT          NULL
    ,new_state_prov_cd                                              TEXT          NULL
    ,old_buyback_yes_no_cd                                          TEXT          NULL
    ,new_buyback_yes_no_cd                                          TEXT          NULL
    ,old_addl_cov_form_num                                          TEXT          NULL
    ,new_addl_cov_form_num                                          TEXT          NULL
    ,old_addl_edition_dt                                            TEXT          NULL
    ,new_addl_edition_dt                                            TEXT          NULL
    ,old_addl_coverage_1_limit                                      TEXT          NULL
    ,new_addl_coverage_1_limit                                      TEXT          NULL
    ,old_addl_coverage_2_limit                                      TEXT          NULL
    ,new_addl_coverage_2_limit                                      TEXT          NULL
    ,old_addl_deductible_1_amt                                      TEXT          NULL
    ,new_addl_deductible_1_amt                                      TEXT          NULL
    ,old_addl_deductible_2_amt                                      TEXT          NULL
    ,new_addl_deductible_2_amt                                      TEXT          NULL
    ,old_addl_deductible_factor                                     TEXT          NULL
    ,new_addl_deductible_factor                                     TEXT          NULL
    ,old_addl_cov_deductible_type                                   TEXT          NULL
    ,new_addl_cov_deductible_type                                   TEXT          NULL
    ,old_addl_cov_deductible_credit_pct                             TEXT          NULL
    ,new_addl_cov_deductible_credit_pct                             TEXT          NULL
    ,old_additional_coverage_info                                   TEXT          NULL
    ,new_additional_coverage_info                                   TEXT          NULL
    ,old_addl_cov_1_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_1_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_2_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_2_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_3_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_3_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_4_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_4_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_5_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_5_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_6_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_6_vehicle_num                                     TEXT          NULL
    ,old_addl_cov_7_vehicle_num                                     TEXT          NULL
    ,new_addl_cov_7_vehicle_num                                     TEXT          NULL
    ,old_miscellaneous_options_info                                 TEXT          NULL
    ,new_miscellaneous_options_info                                 TEXT          NULL
    ,old_miscellaneous_options_1_cd                                 TEXT          NULL
    ,new_miscellaneous_options_1_cd                                 TEXT          NULL
    ,old_miscellaneous_options_2_cd                                 TEXT          NULL
    ,new_miscellaneous_options_2_cd                                 TEXT          NULL
    ,old_addlcov_option_info                                        TEXT          NULL
    ,new_addlcov_option_info                                        TEXT          NULL
    ,old_addl_cov_option_1_cd                                       TEXT          NULL
    ,new_addl_cov_option_1_cd                                       TEXT          NULL
    ,old_addl_cov_option_2_cd                                       TEXT          NULL
    ,new_addl_cov_option_2_cd                                       TEXT          NULL
    ,old_addl_cov_option_3_cd                                       TEXT          NULL
    ,new_addl_cov_option_3_cd                                       TEXT          NULL
    ,old_addl_cov_option_4_cd                                       TEXT          NULL
    ,new_addl_cov_option_4_cd                                       TEXT          NULL
    ,old_addl_cov_benefits_info                                     TEXT          NULL
    ,new_addl_cov_benefits_info                                     TEXT          NULL
    ,old_addl_cov_benefits_1_cd                                     TEXT          NULL
    ,new_addl_cov_benefits_1_cd                                     TEXT          NULL
    ,old_addl_cov_benefits_2_cd                                     TEXT          NULL
    ,new_addl_cov_benefits_2_cd                                     TEXT          NULL
    ,old_addl_cov_benefits_3_cd                                     TEXT          NULL
    ,new_addl_cov_benefits_3_cd                                     TEXT          NULL
    ,old_addl_cov_rate_factor                                       TEXT          NULL
    ,new_addl_cov_rate_factor                                       TEXT          NULL
    ,old_addl_cov_premium_amt                                       TEXT          NULL
    ,new_addl_cov_premium_amt                                       TEXT          NULL
    ,old_addl_coverage_cd_desc                                      TEXT          NULL
    ,new_addl_coverage_cd_desc                                      TEXT          NULL
    ,audit_action                                                   char(1)         not null 
    ,audit_user                                                     text            not null            default current_user 
    ,audit_timestamp                                                timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gd_coverages_additional_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_gd_coverages_additional_coverage_info to rl_sagitta_a;
go 
