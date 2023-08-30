create table benefitpoint.capitated_fee (
     commission_id                                int                         not null 
    ,fee                                    double precision            null 
    ,estimated_number_of_employees          int                         null 
    ,fee_lives_type                         text                        null 
    ,fee_interval_type                      text                        null 
    ,constraint capitated_fee_pkey  primary key (commission_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.capitated_fee owner to mj_admin;
go 

grant select on benefitpoint.capitated_fee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.capitated_fee to rl_benefitpoint_a;
go 

grant update on benefitpoint.capitated_fee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.capitated_fee for each row execute function benefitpoint.tr_audit_capitated_fee_d();
go 

create trigger audit_i after insert on benefitpoint.capitated_fee for each row execute function benefitpoint.tr_audit_capitated_fee_i();
go 

create trigger audit_u after update on benefitpoint.capitated_fee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_capitated_fee_u();
go 
