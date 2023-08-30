create table benefitpoint.rate_type (
     rate_type_id           int             not null 
    ,description            text            null 
    ,funding_type            text            null 
    ,constraint rate_type_pkey  primary key (rate_type_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_type owner to mj_admin;
go 

grant select on benefitpoint.rate_type to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_type to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate_type to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_type for each row execute function benefitpoint.tr_audit_rate_type_d();
go 

create trigger audit_i after insert on benefitpoint.rate_type for each row execute function benefitpoint.tr_audit_rate_type_i();
go 

create trigger audit_u after update on benefitpoint.rate_type for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_type_u();
go 