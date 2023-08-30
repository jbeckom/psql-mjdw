create table benefitpoint.split_payee (
     split_id                   int                         not null 
    ,payee_id                   int                         not null 
    ,commisssion                double precision            null 
    ,override                   double precision            null 
    ,bonus                      double precision            null 
    ,bob                        double precision            null 
    ,sort_order                 int                         null 
    ,ignore_split_team          bool                        null 
    ,round_to                   bool                        null 
    ,payee_role_type            text                        null 
    ,constraint split_payee_pkey    primary key (split_id, payee_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.split_payee owner to mj_admin;
go 

grant select on benefitpoint.split_payee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.split_payee to rl_benefitpoint_a;
go 

grant update on benefitpoint.split_payee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.split_payee for each row execute function benefitpoint.tr_audit_split_payee_d();
go 

create trigger audit_i after insert on benefitpoint.split_payee for each row execute function benefitpoint.tr_audit_split_payee_i();
go

create trigger audit_u after update on benefitpoint.split_payee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_split_payee_u();
go 
