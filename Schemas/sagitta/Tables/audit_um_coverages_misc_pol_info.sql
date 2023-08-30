create table sagitta.audit_um_coverages_misc_pol_info (
     sagitem                            int             not null 
    ,lis                                int             not null 
    ,old_misc_pol_seq_number            text            null 
    ,new_misc_pol_seq_number            text            null 
    ,old_misc_pol_number                text            null 
    ,new_misc_pol_number                text            null 
    ,old_misc_coverage_code             text            null 
    ,new_misc_coverage_code             text            null 
    ,old_misc_insurer                   text            null 
    ,new_misc_insurer                   text            null 
    ,old_misc_insurer_name              text            null 
    ,new_misc_insurer_name              text            null 
    ,old_misc_effective_date            text            null 
    ,new_misc_effective_date            text            null 
    ,old_misc_exp_date                  text            null 
    ,new_misc_exp_date                  text            null 
    ,old_misc_rate_mod                  text            null 
    ,new_misc_rate_mod                  text            null 
    ,old_misc_first_cov_info            text            null 
    ,new_misc_first_cov_info            text            null 
    ,old_misc_first_cov_descr           text            null 
    ,new_misc_first_cov_descr           text            null 
    ,old_misc_first_cov_limit           text            null 
    ,new_misc_first_cov_limit           text            null 
    ,old_misc_second_cov_info           text            null 
    ,new_misc_second_cov_info           text            null 
    ,old_misc_second_cov_descr          text            null 
    ,new_misc_second_cov_descr          text            null 
    ,old_misc_second_cov_limit          text            null 
    ,new_misc_second_cov_limit          text            null 
    ,old_acord_coverage_type            text            null 
    ,new_acord_coverage_type            text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages_misc_pol_info owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages_misc_pol_info to rl_sagitta_a;
go 