drop table if exists psj.department_goals;
go 

create table if not exists psj.department_goals (
     fiscal_year            text                not null 
    ,department             char(3)             not null 
    ,description            text                null 
    ,target                 int                 null 
    ,id                     bigint              not null            generated always as identity            primary key 
    ,constraint department_goals_fiscal_year_department_uq  unique (fiscal_year,department)
);
go 

/*** PERMISSIONS ***/
alter table psj.department_goals owner to mj_admin;
go 

grant select on psj.department_goals to rl_psj_r;
go 

grant insert on psj.department_goals to rl_psj_a;
go 

grant update on psj.department_goals to rl_psj_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on psj.department_goals for each row execute function audit.tr_psj_log_change();
go 