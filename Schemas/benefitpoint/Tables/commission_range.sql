create table benefitpoint.commission_range (
     source_type                        text                        not null 
    ,commission_id                      int                         not null 
    ,value                              double precision            null 
    ,value_unit_of_measure              text                        null 
    ,from_range                         double precision            null 
    ,to_range                           double precision            null 
    ,sort_order                         int                         not null 
    ,constraint commission_range_pkey   primary key (source_type,commission_id,sort_order)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.commission_range owner to mj_admin;
go 

grant select on benefitpoint.commission_range to rl_benefitpoint_r;
go 

grant insert on benefitpoint.commission_range to rl_benefitpoint_a;
go 

grant update on benefitpoint.commission_range to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.commission_range for each row execute function benefitpoint.tr_audit_commission_range_d();
go 

create trigger audit_i after insert on benefitpoint.commission_range for each row execute function benefitpoint.tr_audit_commission_range_i();
go 

create trigger audit_u after update on benefitpoint.commission_range for each row when (old is distinct from new) execute function benefitpoint.tr_audit_commission_range_u();