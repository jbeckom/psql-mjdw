create table benefitpoint.split_column (
     split_id                   int             not null 
    ,split_column_id            int             not null 
    ,split_basis_type           text            null 
    ,split_column_type          text            null 
    ,constraint split_column_pkey   primary key (split_id, split_column_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.split_column owner to mj_admin;
go 

grant select on benefitpoint.split_column to rl_benefitpoint_r;
go 

grant insert on benefitpoint.split_column to rl_benefitpoint_a;
go 

grant update on benefitpoint.split_column to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.split_column for each row execute function benefitpoint.tr_audit_split_column_d();
go 

create trigger audit_i after insert on benefitpoint.split_column for each row execute function benefitpoint.tr_audit_split_column_i();
go 

create trigger audit_u after update on benefitpoint.split_column for each row when (old is distinct from new) execute function benefitpoint.tr_audit_split_column_u();
go 