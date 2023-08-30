create table benefitpoint.split (
     split_id                   int                 not null 
    ,product_ids                text                null 
    ,effective_as_of            timestamp           null 
    ,notes                      text                null 
    ,last_modified_on           timestamp           null 
    ,created_on                 timestamp           null 
    ,constraint split_pkey  primary key (split_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.split owner to mj_admin;
go 

grant select on benefitpoint.split to rl_benefitpoint_r;
go 

grant insert on benefitpoint.split to rl_benefitpoint_a;
go 

grant update on benefitpoint.split to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.split for each row execute function benefitpoint.tr_audit_split_d();
go 

create trigger audit_i after insert on benefitpoint.split for each row execute function benefitpoint.tr_audit_split_i();
go 

create trigger audit_u after update on benefitpoint.split for each row when (old is distinct from new) execute function benefitpoint.tr_audit_split_u();
go 