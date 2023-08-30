create table sagitta.gd_coverages_doc_coverage_info (
     sagitem                                int             not null 
    ,lis                                    int             not null 
    ,doc_class_cd                           text            null 
    ,doc_location_number                    text            null 
    ,state_prov_cd                          text            null 
    ,rating_territory_desc                  text            null 
    ,num_employees                          text            null 
    ,num_individuals_covered                text            null 
    ,fin_resp_doc_cert_yes_no_cd            text            null 
    ,doc_driver_info                        text            null 
    ,driver_1_number                        text            null 
    ,driver_2_number                        text            null 
    ,driver_3_number                        text            null 
    ,driver_4_number                        text            null 
    ,driver_5_number                        text            null 
    ,driver_6_number                        text            null 
    ,driver_7_number                        text            null 
    ,driver_8_number                        text            null 
    ,driver_9_number                        text            null 
    ,constraint gd_coverages_doc_coverage_info_pkey             primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gd_coverages_doc_coverage_info owner to mj_admin;
go 

grant select on sagitta.gd_coverages_doc_coverage_info to rl_sagitta_a;
go 

grant insert on sagitta.gd_coverages_doc_coverage_info to rl_sagitta_a;
go 

grant update on sagitta.gd_coverages_doc_coverage_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gd_coverages_doc_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_doc_coverage_info_d();
go 

create trigger audit_i after insert on sagitta.gd_coverages_doc_coverage_info for each row execute function sagitta.tr_audit_gd_coverages_doc_coverage_info_i();
go 

create trigger audit_u after update on sagitta.gd_coverages_doc_coverage_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gd_coverages_doc_coverage_info_u();
go 
