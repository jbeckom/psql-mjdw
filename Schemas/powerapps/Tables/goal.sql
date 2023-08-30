drop table if exists powerapps.goal;
go 

create table if not exists powerapps.goal (
     producer                       text            null 
    ,fiscal_time_period             text            null 
    ,written_commitment             int             null 
    ,earned_commitment              int             null 
    ,department                     text            null 
    ,department_number              text            null 
    ,start_date                     date            null 
    ,first_meeting_goal             int             null 
    ,guid                           uuid            null 
    ,id                             bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table powerapps.goal owner to mj_admin;
go 

grant select on powerapps.goal to rl_powerapps_r;
go 

grant insert on powerapps.goal to rl_powerapps_a;
go 

grant update on powerapps.goal to rl_powerapps_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on powerapps.goal for each row execute function audit.tr_powerapps_log_change();
go 