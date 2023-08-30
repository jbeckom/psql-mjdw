create table sagitta.audit_gd_coverages_non_owned_coverage_info (
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,old_non_owned_class_cd                         text            null 
    ,new_non_owned_class_cd                         text            null 
    ,old_non_owned_location_number                  text            null 
    ,new_non_owned_location_number                  text            null 
    ,old_non_owned_state_prov_cd                    text            null 
    ,new_non_owned_state_prov_cd                    text            null 
    ,old_non_owned_group_type_cd                    text            null 
    ,new_non_owned_group_type_cd                    text            null 
    ,old_num_non_owned                              text            null 
    ,new_num_non_owned                              text            null 
    ,old_non_owned_pct                              text            null 
    ,new_non_owned_pct                              text            null 
    ,old_social_service_agency_ind                  text            null 
    ,new_social_service_agency_ind                  text            null 
    ,old_non_owned_individual_yes_no_cd             text            null 
    ,new_non_owned_individual_yes_no_cd             text            null 
    ,audit_action                                   char(1)         not null 
    ,audit_user                                     text            not null            default current_user 
    ,audit_timestamp                                timestamp       not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gd_coverages_non_owned_coverage_info owner to mj_admin;
go 

grant insert on sagitta.audit_gd_coverages_non_owned_coverage_info to rl_sagitta_a;
go 
