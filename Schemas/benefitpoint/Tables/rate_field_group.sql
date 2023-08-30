create table benefitpoint.rate_field_group (
     rate_field_group_id            int             not null 
    ,description                    text            null 
    ,max_values_allowed             int             null 
    ,rate_field_group_type          text            null 
    ,constraint rate_field_group_pkey   primary key (rate_field_group_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_field_group owner to mj_admin;
go 

grant select on benefitpoint.rate_field_group to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_field_group to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate_field_group to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_field_group for each row execute function benefitpoint.tr_audit_rate_field_group_d();
go 

create trigger audit_i after insert on benefitpoint.rate_field_group for each row execute function benefitpoint.tr_audit_rate_field_group_i();
go 

create trigger audit_u after update on benefitpoint.rate_field_group for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_field_group_u();
go 