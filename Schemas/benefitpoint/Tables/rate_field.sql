create table benefitpoint.rate_field (
     rate_field_id              int             not null 
    ,label                      text            null 
    ,field_type                 text            null 
    ,field_value_type           text            null 
    ,rate_field_group           int             null 
    ,tiered                     bool            null 
    ,calculated                 bool            null 
    ,constraint rate_field_pkey     primary key (rate_field_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_field owner to mj_admin;
go 

grant select on benefitpoint.rate_field to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_field to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate_field to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_field for each row execute function benefitpoint.tr_audit_rate_field_d();
go 

create trigger audit_i after insert on benefitpoint.rate_field for each row execute function benefitpoint.tr_audit_rate_field_i();
go 

create trigger audit_u after update on benefitpoint.rate_field for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_field_u();
go 
