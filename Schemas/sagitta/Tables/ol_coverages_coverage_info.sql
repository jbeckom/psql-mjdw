create table sagitta.ol_coverages_coverage_info(
     sagitem                        int             not null 
    ,lis                            int             not null 
    ,coverage_cd                    text            null 
    ,state_prov_cd                  text            null 
    ,location_number                text            null 
    ,building_number                text            null 
    ,form_number                    text            null 
    ,addl_cov_edition_dt            text            null 
    ,rate                           text            null 
    ,co_insurance                   text            null 
    ,premium_amt                    text            null 
    ,limit_1                        text            null 
    ,limit_1_desc_code              text            null 
    ,deductible_1                   text            null 
    ,ded_symbol_1                   text            null 
    ,deductible_basis_cd_1          text            null 
    ,deductible_type_cd_1           text            null 
    ,limit_2                        text            null 
    ,limit_2_desc_code              text            null 
    ,deductible_2                   text            null 
    ,ded_symbol_2                   text            null 
    ,deductible_basis_cd_2          text            null 
    ,deductible_type_cd_2           text            null 
    ,exposure_1                     text            null 
    ,territory                      text            null 
    ,coverage_desc                  text            null 
    ,addl_info_ind                  text            null 
    ,vehicle_no                     text            null 
    ,rating_basis                   text            null 
    ,valuation_code_1               text            null 
    ,valuation_code_2               text            null 
    ,cause_of_loss                  text            null 
    ,cov_effective_date             text            null 
    ,cov_expiration_date            text            null 
    ,exposure_1basis                text            null 
    ,exposure_2                     text            null 
    ,exposure_2basis                text            null 
    ,cov_type_code                  text            null 
    ,constraint ol_coverages_coverage_info_pkey     primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.ol_coverages_coverage_info owner to mj_admin;
go 

grant select on sagitta.ol_coverages_coverage_info to rl_sagitta_r;
go 

grant insert on sagitta.ol_coverages_coverage_info to rl_sagitta_a;
go 

grant update on sagitta.ol_coverages_coverage_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.ol_coverages_coverage_info for each row execute function sagitta.tr_audit_ol_coverages_coverage_info_d();
go 

create trigger audit_i after insert on sagitta.ol_coverages_coverage_info for each row execute function sagitta.tr_audit_ol_coverages_coverage_info_i();
go 

create trigger audit_u after update on sagitta.ol_coverages_coverage_info for each row when (old is distinct from new) execute function sagitta.tr_audit_ol_coverages_coverage_info_u();
go 