create table sagitta.audit_um_coverages (
     sagitem                                    int             not null 
    ,old_audit_staff_cd                         text            null 
    ,new_audit_staff_cd                         text            null 
    ,old_audit_entry_dt                         int             null 
    ,new_audit_entry_dt                         int             null 
    ,old_audit_time                             int             null 
    ,new_audit_time                             int             null 
    ,old_audit_cd                               text            null 
    ,new_audit_cd                               text            null 
    ,old_audit_history_record_number            text            null 
    ,new_audit_history_record_number            text            null 
    ,old_audit_program                          text            null 
    ,new_audit_program                          text            null 
    ,old_audit_effective_dt                     text            null 
    ,new_audit_effective_dt                     text            null 
    ,old_audit_change_agency_id                 text            null 
    ,new_audit_change_agency_id                 text            null 
    ,old_policy_agency_id                       text            null 
    ,new_policy_agency_id                       text            null 
    ,old_follow_umb_form                        text            null 
    ,new_follow_umb_form                        text            null 
    ,old_follow_form_excess                     text            null 
    ,new_follow_form_excess                     text            null 
    ,old_umbrella_excess                        text            null 
    ,new_umbrella_excess                        text            null 
    ,old_liab_each_occur_limit                  text            null 
    ,new_liab_each_occur_limit                  text            null 
    ,old_liab_annual_aggregate                  text            null 
    ,new_liab_annual_aggregate                  text            null 
    ,old_retained_limit                         text            null 
    ,new_retained_limit                         text            null 
    ,old_first_dollar_defense                   text            null 
    ,new_first_dollar_defense                   text            null 
    ,old_current_retro_date                     text            null 
    ,new_current_retro_date                     text            null 
    ,old_off_dt                                 text            null 
    ,new_off_dt                                 text            null 
    ,old_desc_of_underlying_cov                 text            null 
    ,new_desc_of_underlying_cov                 text            null 
    ,old_garagekeepers_coverage                 text            null 
    ,new_garagekeepers_coverage                 text            null 
    ,old_garagekeepers_exposure                 text            null 
    ,new_garagekeepers_exposure                 text            null 
    ,old_aircraft_pass_coverage                 text            null 
    ,new_aircraft_pass_coverage                 text            null 
    ,old_aircraft_pass_exposure                 text            null 
    ,new_aircraft_pass_exposure                 text            null 
    ,old_care_custody_coverage                  text            null 
    ,new_care_custody_coverage                  text            null 
    ,old_care_custody_exposure                  text            null 
    ,new_care_custody_exposure                  text            null 
    ,old_professional_coverage                  text            null 
    ,new_professional_coverage                  text            null 
    ,old_professional_exposure                  text            null 
    ,new_professional_exposure                  text            null 
    ,old_foreign_liab_coverage                  text            null 
    ,new_foreign_liab_coverage                  text            null 
    ,old_foreign_liab_exposure                  text            null 
    ,new_foreign_liab_exposure                  text            null 
    ,old_malpractice_coverage                   text            null 
    ,new_malpractice_coverage                   text            null 
    ,old_malpractive_exposure                   text            null 
    ,new_malpractive_exposure                   text            null 
    ,old_aircraft_liab_coverage                 text            null 
    ,new_aircraft_liab_coverage                 text            null 
    ,old_aircraft_liab_exposure                 text            null 
    ,new_aircraft_liab_exposure                 text            null 
    ,old_add_int_coverage                       text            null 
    ,new_add_int_coverage                       text            null 
    ,old_add_int_exposure                       text            null 
    ,new_add_int_exposure                       text            null 
    ,old_emp_benefit_coverage                   text            null 
    ,new_emp_benefit_coverage                   text            null 
    ,old_emp_benefit_exposure                   text            null 
    ,new_emp_benefit_exposure                   text            null 
    ,old_liquor_coverage                        text            null 
    ,new_liquor_coverage                        text            null 
    ,old_liquor_exposure                        text            null 
    ,new_liquor_exposure                        text            null 
    ,old_pollution_coverage                     text            null 
    ,new_pollution_coverage                     text            null 
    ,old_pollution_exposure                     text            null 
    ,new_pollution_exposure                     text            null 
    ,old_vendors_liab_coverage                  text            null 
    ,new_vendors_liab_coverage                  text            null 
    ,old_vendors_liab_exposure                  text            null 
    ,new_vendors_liab_exposure                  text            null 
    ,old_watercraft_coverage                    text            null 
    ,new_watercraft_coverage                    text            null 
    ,old_watercraft_exposure                    text            null 
    ,new_watercraft_exposure                    text            null 
    ,old_first_other_description                text            null 
    ,new_first_other_description                text            null 
    ,old_first_other_coverage                   text            null 
    ,new_first_other_coverage                   text            null 
    ,old_first_other_exposure                   text            null 
    ,new_first_other_exposure                   text            null 
    ,old_second_other_description               text            null 
    ,new_second_other_description               text            null 
    ,old_second_other_coverage                  text            null 
    ,new_second_other_coverage                  text            null 
    ,old_second_other_exposure                  text            null 
    ,new_second_other_exposure                  text            null 
    ,old_third_other_description                text            null 
    ,new_third_other_description                text            null 
    ,old_third_other_coverage                   text            null 
    ,new_third_other_coverage                   text            null 
    ,old_third_other_exposure                   text            null 
    ,new_third_other_exposure                   text            null 
    ,old_fourth_other_description               text            null 
    ,new_fourth_other_description               text            null 
    ,old_fourth_other_coverage                  text            null 
    ,new_fourth_other_coverage                  text            null 
    ,old_fourth_other_exposure                  text            null 
    ,new_fourth_other_exposure                  text            null 
    ,old_retro_coverage_yes_no_cd               text            null 
    ,new_retro_coverage_yes_no_cd               text            null 
    ,old_retro_proposed_date                    text            null 
    ,new_retro_proposed_date                    text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages to rl_sagitta_a;
go 
