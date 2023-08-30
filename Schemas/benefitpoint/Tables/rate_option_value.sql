create table benefitpoint.rate_option_value (
     rate_field_id                  int             not null 
    ,rate_option_value_id           int             not null 
    ,description                    text            null 
    ,constraint rate_option_value_pkey  primary key (rate_field_id, rate_option_value_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_option_value owner to mj_admin;
go 

grant select on benefitpoint.rate_option_value to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_option_value to rl_benefitpoint_a;
go 

grant update on benefitpoint.rate_option_value to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_option_value for each row execute function benefitpoint.tr_audit_rate_option_value_d(); 
go 

create trigger audit_i after insert on benefitpoint.rate_option_value for each row execute function benefitpoint.tr_audit_rate_option_value_i(); 
go 

create trigger audit_u after update on benefitpoint.rate_option_value for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_option_value_u();
go 