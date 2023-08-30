create table sagitta.audit_gd_coverages_doc_coverage_info (
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,old_doc_class_cd                           text            null 
    ,new_doc_class_cd                           text            null 
    ,old_doc_location_number                    text            null 
    ,new_doc_location_number                    text            null 
    ,old_state_prov_cd                          text            null 
    ,new_state_prov_cd                          text            null 
    ,old_rating_territory_desc                  text            null 
    ,new_rating_territory_desc                  text            null 
    ,old_num_employees                          text            null 
    ,new_num_employees                          text            null 
    ,old_num_individuals_covered                text            null 
    ,new_num_individuals_covered                text            null 
    ,old_fin_resp_doc_cert_yes_no_cd            text            null 
    ,new_fin_resp_doc_cert_yes_no_cd            text            null 
    ,old_doc_driver_info                        text            null 
    ,new_doc_driver_info                        text            null 
    ,old_driver_1_number                        text            null 
    ,new_driver_1_number                        text            null 
    ,old_driver_2_number                        text            null 
    ,new_driver_2_number                        text            null 
    ,old_driver_3_number                        text            null 
    ,new_driver_3_number                        text            null 
    ,old_driver_4_number                        text            null 
    ,new_driver_4_number                        text            null 
    ,old_driver_5_number                        text            null 
    ,new_driver_5_number                        text            null 
    ,old_driver_6_number                        text            null 
    ,new_driver_6_number                        text            null 
    ,old_driver_7_number                        text            null 
    ,new_driver_7_number                        text            null 
    ,old_driver_8_number                        text            null 
    ,new_driver_8_number                        text            null 
    ,old_driver_9_number                        text            null 
    ,new_driver_9_number                        text            null 
    ,audit_action                               char(1)         not null 
    ,audit_user                                 text            not null            default current_user 
    ,audit_timestamp                            timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                   bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gd_coverages_doc_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_gd_coverages_doc_coverage_info to rl_sagitta_a;
go 
