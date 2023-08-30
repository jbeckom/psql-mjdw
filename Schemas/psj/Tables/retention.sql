drop table if exists psj.retention;

create table if not exists psj.retention (
     month                  date            not null 
    ,"group"                text            not null 
    ,expiring_accts         int             null 
    ,renewed_accts          int             null 
    ,id                     bigint          not null            generated always as identity            primary key 
    ,constraint retention_month_group_uq    unique (month,"group")
);
go 

/*** PERMISSIONS ***/
alter table psj.retention owner to mj_admin;
go 

grant select on psj.retention to rl_psj_r;
go 

grant insert on psj.retention to rl_psj_a;
go 

grant update on psj.retention to rl_psj_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on psj.retention for each row execute function audit.tr_psj_log_change();
go 