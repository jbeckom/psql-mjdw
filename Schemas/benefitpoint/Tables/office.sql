drop table if exists benefitpoint.office;
go 

create table benefitpoint.office (
     office_id              int             not null 
    ,office_name            text            null 
    ,region_name            text            null 
    ,constraint office_pkey     primary key (office_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.office owner to mj_admin;
go 

grant select on benefitpoint.office to rl_benefitpoint_r;
go 

grant insert on benefitpoint.office to rl_benefitpoint_a;
go 

grant update on benefitpoint.office to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.office for each row execute function benefitpoint.tr_audit_office_d();
go 

create trigger audit_i after insert on benefitpoint.office for each row execute function benefitpoint.tr_audit_office_i();
go 

create trigger audit_u after update on benefitpoint.office for each row when (old is distinct from new) execute function benefitpoint.tr_audit_office_u();
go 