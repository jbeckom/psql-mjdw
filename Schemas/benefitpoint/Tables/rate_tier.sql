create table benefitpoint.rate_tier (
     rate_field_id                  int             not null 
    ,rate_tier_id                   int             not null 
    ,description                    text            null 
    ,allow_include_ee               bool            null 
    ,constraint rate_tier_pkey  primary key (rate_field_id,rate_tier_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_tier owner to mj_admin;
go 

grant select on benefitpoint.rate_tier to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_tier to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate_tier to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_tier for each row execute function benefitpoint.tr_audit_rate_tier_d();
go 

create trigger audit_i after insert on benefitpoint.rate_tier for each row execute function benefitpoint.tr_audit_rate_tier_i();
go 

create trigger audit_u after update on benefitpoint.rate_tier for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_tier_u();
go 