create table sagitta.audit_payees_div_dept_designations(
     sagitem                        text            not null 
    ,lis                            int             not null 
    ,old_valid_div                  text            null 
    ,new_valid_div                  text            null 
    ,old_valid_dept                 text            null 
    ,new_valid_dept                 text            null 
    ,old_limit_new                  text            null 
    ,new_limit_new                  text            null 
    ,old_limit_new_date             text            null 
    ,new_limit_new_date             text            null 
    ,old_limit_renew                text            null 
    ,new_limit_renew                text            null 
    ,old_limit_renew_date           text            null 
    ,new_limit_renew_date           text            null 
    ,audit_action                   char(1)         not null 
    ,audit_user                     text            not null            default current_user 
    ,audit_timestamp                timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_payees_div_dept_designations owner to mj_admin;
go 

grant insert on sagitta.audit_payees_div_dept_designations to rl_sagitta_a;
go 
