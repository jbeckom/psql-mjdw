create table sagitta.audit_vendors_producer_dbap_acct_info (
     sagitem                                text            not null 
    ,lis                                    int             not null 
    ,old_producer_dbap_acct_number          text            null 
    ,new_producer_dbap_acct_number          text            null 
    ,old_producer_dbap_dept_ind             text            null 
    ,new_producer_dbap_dept_ind             text            null 
    ,audit_action                           char(1)         not null 
    ,audit_user                             text            not null            default current_user 
    ,audit_timestamp                        timestamp       not null            default timezone('utc'::text, clock_timestamp())
    ,audit_id                               bigint          not null            generated always as identity            primary key 
);
go  

/*** PERMISSIONS ***/
alter table sagitta.audit_vendors_producer_dbap_acct_info owner to mj_admin;
go 

grant insert on sagitta.audit_vendors_producer_dbap_acct_info to rl_sagitta_a;
go 
