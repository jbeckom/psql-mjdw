create table benefitpoint.rate_field_value (
     rate_id                        int                         not null 
    ,rate_field_id                  int                         not null 
    ,multi_value_index              int                         null 
    ,value_num                      double precision            null 
    ,value_text                     text                        null 
    ,age_band_index                 int                         null 
    ,age_band_gender                text                        null 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.rate_field_value owner to mj_admin;
go 

grant select on benefitpoint.rate_field_value to rl_benefitpoint_r;
go 

grant insert on benefitpoint.rate_field_value to rl_benefitpoint_a;
go 

grant delete on benefitpoint.rate_field_value to rl_benefitpoint_d;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.rate_field_value for each row execute function benefitpoint.tr_audit_rate_field_value_d(); 
go 

create trigger audit_i after insert on benefitpoint.rate_field_value for each row execute function benefitpoint.tr_audit_rate_field_value_i();
go 

create trigger audit_u after update on benefitpoint.rate_field_value for each row when (old is distinct from new) execute function benefitpoint.tr_audit_rate_field_value_u();
go 