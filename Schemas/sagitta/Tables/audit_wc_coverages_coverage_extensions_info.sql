create table sagitta.audit_wc_coverages_coverage_extensions_info(
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,old_coverage_cd                                    text            null 
    ,new_coverage_cd                                    text            null 
    ,old_state_prov_cd                                  text            null 
    ,new_state_prov_cd                                  text            null 
    ,old_form_number                                    text            null 
    ,new_form_number                                    text            null 
    ,old_edition_dt                                     text            null 
    ,new_edition_dt                                     text            null 
    ,old_first_ea_accident_bi_limit                     text            null 
    ,new_first_ea_accident_bi_limit                     text            null 
    ,old_second_bi_by_disease_limit                     text            null 
    ,new_second_bi_by_disease_limit                     text            null 
    ,old_third_per_employee_by_bi_limit                 text            null 
    ,new_third_per_employee_by_bi_limit                 text            null 
    ,old_coverage_extention_annual_premium_amt          text            null 
    ,new_coverage_extention_annual_premium_amt          text            null 
    ,old_coverage_desc                                  text            null 
    ,new_coverage_desc                                  text            null 
    ,old_location_number                                text            null 
    ,new_location_number                                text            null 
    ,old_type_cd                                        text            null 
    ,new_type_cd                                        text            null 
    ,old_deductible_1_amt                               text            null 
    ,new_deductible_1_amt                               text            null 
    ,old_deductible_2_amt                               text            null 
    ,new_deductible_2_amt                               text            null 
    ,old_deductible_1_type_cd                           text            null 
    ,new_deductible_1_type_cd                           text            null 
    ,old_deductible_2_type_cd                           text            null 
    ,new_deductible_2_type_cd                           text            null 
    ,old_rate                                           text            null 
    ,new_rate                                           text            null 
    ,audit_action                                       char(1)         not null 
    ,audit_user                                         text            not null            default current_user 
    ,audit_timestamp                                    timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_wc_coverages_coverage_extensions_info owner to mj_admin;
go 

grant insert on sagitta.audit_wc_coverages_coverage_extensions_info to rl_sagitta_a;
go 
