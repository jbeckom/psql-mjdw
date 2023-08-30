create table benefitpoint.carrier_summary (
     carrier_id             int             not null 
    ,carrier_name           text            null 
    ,carrier_alias          text            null 
    ,constraint carrier_summary_pkey    primary key (carrier_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.carrier_summary owner to mj_admin;
go 

grant select on benefitpoint.carrier_summary to rl_benefitpoint_r;
go 

grant insert on benefitpoint.carrier_summary to rl_benefitpoint_a;
go 

grant update on benefitpoint.carrier_summary to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.carrier_summary for each row execute function benefitpoint.tr_audit_carrier_summary_d();
go 

create trigger audit_i after insert on benefitpoint.carrier_summary for each row execute function benefitpoint.tr_audit_carrier_summary_i();
go 

create trigger audit_u after update on benefitpoint.carrier_summary for each row when (old is distinct from new) execute function benefitpoint.tr_audit_carrier_summary_u();
go