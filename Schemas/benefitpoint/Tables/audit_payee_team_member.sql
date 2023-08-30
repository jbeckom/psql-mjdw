create table benefitpoint.audit_payee_team_member (
     payee_id                       int                         not null 
    ,team_member_id                 int                         not null 
    ,old_commission                 double precision            null 
    ,new_commission                 double precision            null 
    ,audit_action                   char(1)                     not null 
    ,audit_user                     text                        not null            default current_user 
    ,audit_timestamp                timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_payee_team_member owner to mj_admin;
go 

grant insert on benefitpoint.audit_payee_team_member to rl_benefitpoint_a;
go 
