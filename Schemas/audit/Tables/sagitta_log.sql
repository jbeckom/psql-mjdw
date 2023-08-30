drop table if exists audit.sagitta_log;

create table if not exists audit.sagitta_log (
     audit_id               bigint          not null            generated always as identity            primary key 
    ,audit_time             timestamp       not null            default timezone('utc'::TEXT, clock_timestamp())
    ,audit_user             name            not null            default current_user 
    ,audit_client           inet            not null            default inet_client_addr()
    ,operation              text            not null 
    ,table_name             name            not null 
    ,table_key              bigint          not null 
    ,new_record             json            null 
);
go 

/*** PERMISSIONS ***/
alter table audit.sagitta_log owner to mj_admin;
go 

grant select on audit.sagitta_log to rl_audit_r;
go 

grant insert on audit.sagitta_log to rl_audit_a;
go 