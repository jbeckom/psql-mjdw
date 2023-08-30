create table sagitta.audit_chart_of_accounts_master_allocation_info (
     sagitem                            text            null 
    ,old_alloc_gl_acct_number           text            null 
    ,new_alloc_gl_acct_number           text            null 
    ,old_allocation_pct                 text            null 
    ,new_allocation_pct                 text            null 
    ,audit_action                       char(1)         not null 
    ,audit_user                         text            not null            default current_user 
    ,audit_timestamp                    timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                           bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_chart_of_accounts_master_allocation_info owner to mj_admin;
go 

grant insert on sagitta.audit_chart_of_accounts_master_allocation_info to rl_sagitta_a;
go 
