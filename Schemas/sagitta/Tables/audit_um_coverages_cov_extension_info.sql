create table sagitta.audit_um_coverages_cov_extension_info (
    sagitem                                 int             not null 
    ,lis                                    int             not null 
    ,old_cov_extension                      text            null 
    ,new_cov_extension                      text            null 
    ,old_cov_extension_first_limit          text            null 
    ,new_cov_extension_first_limit          text            null 
    ,old_cov_extension_first_ded            text            null 
    ,new_cov_extension_first_ded            text            null 
    ,old_cov_extension_second_limit         text            null 
    ,new_cov_extension_second_limit         text            null 
    ,old_cov_extension_second_ded           text            null 
    ,new_cov_extension_second_ded           text            null 
    ,old_cov_extension_form                 text            null 
    ,new_cov_extension_form                 text            null 
    ,old_cov_extension_edition_date         text            null 
    ,new_cov_extension_edition_date         text            null 
    ,old_cov_extension_premium              text            null 
    ,new_cov_extension_premium              text            null 
    ,old_cov_extension_description          text            null 
    ,new_cov_extension_description          text            null 
    ,audit_action                           char(1)         not null 
    ,audit_user                             text            not null            default current_user 
    ,audit_timestamp                        timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                               bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_um_coverages_cov_extension_info owner to mj_admin;
go 

grant insert on sagitta.audit_um_coverages_cov_extension_info to rl_sagitta_a;
go 
