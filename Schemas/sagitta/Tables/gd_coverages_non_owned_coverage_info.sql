create table sagitta.gd_coverages_non_owned_coverage_info (
     sagitem                                    int             not null 
    ,lis                                        int             not null 
    ,non_owned_class_cd                         text            null 
    ,non_owned_location_number                  text            null 
    ,non_owned_state_prov_cd                    text            null 
    ,non_owned_group_type_cd                    text            null 
    ,num_non_owned                              text            null 
    ,non_owned_pct                              text            null 
    ,social_service_agency_ind                  text            null 
    ,non_owned_individual_yes_no_cd             text            null 
    ,constraint gd_coverages_non_owned_coverage_info_pkey           primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gd_coverages_non_owned_coverage_info owner to mj_admin;
go 

grant select on sagitta.gd_coverages_non_owned_coverage_info to rl_sagitta_r;
go 

grant insert on sagitta.gd_coverages_non_owned_coverage_info to rl_sagitta_a;
go 

grant update on sagitta.gd_coverages_non_owned_coverage_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gd_coverages_non_owned_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_d();
go 

create trigger audit_i after insert on sagitta.gd_coverages_non_owned_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_i();
go 

create trigger audit_u after update on sagitta.gd_coverages_non_owned_coverage_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gd_coverages_non_owned_coverage_info_u();
go 