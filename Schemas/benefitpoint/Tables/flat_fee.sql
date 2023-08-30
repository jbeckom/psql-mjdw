create table benefitpoint.flat_fee (
     commission_id                                      int                         not null 
    ,fee                                                double precision            null 
    ,estimated_number_of_claims                         int                         null 
    ,estimated_number_of_claims_interval_type           text                        null 
    ,fee_interval_type                                  text                        null 
    ,constraint flat_fee_pkey   primary key (commission_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.flat_fee owner to mj_admin;
go 

grant select on benefitpoint.flat_fee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.flat_fee to rl_benefitpoint_a;
go 

grant update on benefitpoint.flat_fee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.flat_fee for each row execute function benefitpoint.tr_audit_flat_fee_d();
go 

create trigger audit_i after insert on benefitpoint.flat_fee for each row execute function benefitpoint.tr_audit_flat_fee_i();
go 

create trigger audit_u after update on benefitpoint.flat_fee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_flat_fee_u();
go 
