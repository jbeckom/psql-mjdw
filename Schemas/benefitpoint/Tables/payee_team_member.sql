create table benefitpoint.payee_team_member (
     payee_id                   int                         not null 
    ,team_member_id             int                         not null 
    ,commission                 double precision            null 
    ,constraint payee_team_member_pkey  primary key (payee_id,team_member_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.payee_team_member owner to mj_admin;
go 

grant select on benefitpoint.payee_team_member to rl_benefitpoint_r;
go 

grant insert on benefitpoint.payee_team_member to rl_benefitpoint_a;
go 

grant update on benefitpoint.payee_team_member to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.payee_team_member for each row execute function benefitpoint.tr_audit_payee_team_member_d();
go 

create trigger audit_i after insert on benefitpoint.payee_team_member for each row execute function benefitpoint.tr_audit_payee_team_member_i();
go 

create trigger audit_u after update on benefitpoint.payee_team_member for each row when (old is distinct from new) execute function benefitpoint.tr_audit_payee_team_member_u();
go 