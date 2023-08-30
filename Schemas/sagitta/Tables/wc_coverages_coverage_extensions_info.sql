create table sagitta.wc_coverages_coverage_extensions_info(
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,coverage_cd                                    text            null 
    ,state_prov_cd                                  text            null 
    ,form_number                                    text            null 
    ,edition_dt                                     text            null 
    ,first_ea_accident_bi_limit                     text            null 
    ,second_bi_by_disease_limit                     text            null 
    ,third_per_employee_by_bi_limit                 text            null 
    ,coverage_extention_annual_premium_amt          text            null 
    ,coverage_desc                                  text            null 
    ,location_number                                text            null 
    ,type_cd                                        text            null 
    ,deductible_1_amt                               text            null 
    ,deductible_2_amt                               text            null 
    ,deductible_1_type_cd                           text            null 
    ,deductible_2_type_cd                           text            null 
    ,rate                                           text            null 
    ,constraint wc_coverages_coverage_extension_info_pkey   primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.wc_coverages_coverage_extensions_info owner to mj_admin;
go 

grant select on sagitta.wc_coverages_coverage_extensions_info to rl_sagitta_r;
go 

grant insert on sagitta.wc_coverages_coverage_extensions_info to rl_sagitta_a;
go 

grant update on sagitta.wc_coverages_coverage_extensions_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.wc_coverages_coverage_extensions_info for each row execute function sagitta.tr_audit_wc_coverages_coverage_extensions_info_d();
go 

create trigger audit_i after insert on sagitta.wc_coverages_coverage_extensions_info for each row execute function sagitta.tr_audit_wc_coverages_coverage_extensions_info_i();
go 

create trigger audit_u after update on sagitta.wc_coverages_coverage_extensions_info for each row when (old is distinct from new) execute function sagitta.tr_audit_wc_coverages_coverage_extensions_info_u();
go 