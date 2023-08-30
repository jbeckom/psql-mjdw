create table sagitta.um_coverages_misc_pol_info(
     sagitem                        int             not null 
    ,lis                            int             not null 
    ,misc_pol_seq_number            text            null 
    ,misc_pol_number                text            null 
    ,misc_coverage_code             text            null 
    ,misc_insurer                   text            null 
    ,misc_insurer_name              text            null 
    ,misc_effective_date            text            null 
    ,misc_exp_date                  text            null 
    ,misc_rate_mod                  text            null 
    ,misc_first_cov_info            text            null 
    ,misc_first_cov_descr           text            null 
    ,misc_first_cov_limit           text            null 
    ,misc_second_cov_info           text            null 
    ,misc_second_cov_descr          text            null 
    ,misc_second_cov_limit          text            null 
    ,acord_coverage_type            text            null 
    ,constraint um_coverages_misc_pol_info_pkey     primary key (sagitem,lis)
);
go

/*** PERMISSIONS ***/
alter table sagitta.um_coverages_misc_pol_info owner to mj_admin;
go 

grant select on sagitta.um_coverages_misc_pol_info to rl_sagitta_r;
go 

grant insert on sagitta.um_coverages_misc_pol_info to rl_sagitta_a;
go 

grant update on sagitta.um_coverages_misc_pol_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.um_coverages_misc_pol_info for each row execute function sagitta.tr_audit_um_coverages_misc_pol_info_d();
go 

create trigger audit_i after insert on sagitta.um_coverages_misc_pol_info for each row execute function sagitta.tr_audit_um_coverages_misc_pol_info_i();
go 

create trigger audit_u after update on sagitta.um_coverages_misc_pol_info for each row execute function sagitta.tr_audit_um_coverages_misc_pol_info_u();
go 
