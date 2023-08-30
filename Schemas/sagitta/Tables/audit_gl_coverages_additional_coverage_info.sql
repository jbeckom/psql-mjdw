create table sagitta.audit_gl_coverages_additional_coverage_info (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,old_gl_coverage_cd                     text            null 
    ,new_gl_coverage_cd                     text            null 
    ,old_hazard_number                      text            null 
    ,new_hazard_number                      text            null 
    ,old_form_number                        text            null 
    ,new_form_number                        text            null 
    ,old_edition_dt                         text            null 
    ,new_edition_dt                         text            null 
    ,old_cov_1_limit                        text            null 
    ,new_cov_1_limit                        text            null 
    ,old_cov_2_limit                        text            null 
    ,new_cov_2_limit                        text            null 
    ,old_deductible                         text            null 
    ,new_deductible                         text            null 
    ,old_cov_1_type_deductible              text            null 
    ,new_cov_1_type_deductible              text            null 
    ,old_cov_1_basis_1_deductible           text            null 
    ,new_cov_1_basis_1_deductible           text            null 
    ,old_cov_1_basis_2_deductible           text            null 
    ,new_cov_1_basis_2_deductible           text            null 
    ,old_cov_rate                           text            null 
    ,new_cov_rate                           text            null 
    ,old_premium_amt                        text            null 
    ,new_premium_amt                        text            null 
    ,old_job_number                         text            null 
    ,new_job_number                         text            null 
    ,old_num_one                            text            null 
    ,new_num_one                            text            null 
    ,old_num_two                            text            null 
    ,new_num_two                            text            null 
    ,old_type_dt                            text            null 
    ,new_type_dt                            text            null 
    ,old_dt                                 text            null 
    ,new_dt                                 text            null 
    ,old_coverage_desc                      text            null 
    ,new_coverage_desc                      text            null 
    ,old_coverage_2_deductible              text            null 
    ,new_coverage_2_deductible              text            null 
    ,old_coverage_2_ded_type                text            null 
    ,new_coverage_2_ded_type                text            null 
    ,old_cov_2_basis_1_deductible           text            null 
    ,new_cov_2_basis_1_deductible           text            null 
    ,old_cov_basis_2_deductible             text            null 
    ,new_cov_basis_2_deductible             text            null 
    ,old_location_agency_id                 text            null 
    ,new_location_agency_id                 text            null 
    ,old_state_prov_cd                      text            null 
    ,new_state_prov_cd                      text            null 
    ,old_line_1_remark_text                 text            null 
    ,new_line_1_remark_text                 text            null 
    ,old_line_2_remark_text                 text            null 
    ,new_line_2_remark_text                 text            null 
    ,old_building_num                       text            null 
    ,new_building_num                       text            null 
    ,audit_action                           char(1)         not null 
    ,audit_user                             text            not null            default current_user 
    ,audit_timestamp                        timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                               bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gl_coverages_additional_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_gl_coverages_additional_coverage_info to rl_sagitta_a;
go 
