create table sagitta.gl_coverages_additional_coverage_info (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,gl_coverage_cd                     text            null 
    ,hazard_number                      text            null 
    ,form_number                        text            null 
    ,edition_dt                         text            null 
    ,cov_1_limit                        text            null 
    ,cov_2_limit                        text            null 
    ,deductible                         text            null 
    ,cov_1_type_deductible              text            null 
    ,cov_1_basis_1_deductible           text            null 
    ,cov_1_basis_2_deductible           text            null 
    ,cov_rate                           text            null 
    ,premium_amt                        text            null 
    ,job_number                         text            null 
    ,num_one                            text            null 
    ,num_two                            text            null 
    ,type_dt                            text            null 
    ,dt                                 text            null 
    ,coverage_desc                      text            null 
    ,coverage_2_deductible              text            null 
    ,coverage_2_ded_type                text            null 
    ,cov_2_basis_1_deductible           text            null 
    ,cov_basis_2_deductible             text            null 
    ,location_agency_id                 text            null 
    ,state_prov_cd                      text            null 
    ,line_1_remark_text                 text            null 
    ,line_2_remark_text                 text            null 
    ,building_num                       text            null 
    ,constraint     gl_coverages_additional_coverage_info_pkey  primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gl_coverages_additional_coverage_info owner to mj_admin;
go 

grant select on sagitta.gl_coverages_additional_coverage_info to rl_sagitta_r;
go 

grant insert on sagitta.gl_coverages_additional_coverage_info to rl_sagitta_a;
go 

grant update on sagitta.gl_coverages_additional_coverage_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gl_coverages_additional_coverage_info for each row execute function sagitta.tr_audit_gl_coverages_additional_coverage_info_d();
go 

create trigger audit_i after insert on sagitta.gl_coverages_additional_coverage_info for each row execute function sagitta.tr_audit_gl_coverages_additional_coverage_info_i();
go 

create trigger audit_u after update on sagitta.gl_coverages_additional_coverage_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gl_coverages_additional_coverage_info_u();
go 