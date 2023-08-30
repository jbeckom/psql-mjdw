create table benefitpoint.audit_split_column (
     split_id                       int                 not null 
    ,split_column_id                int                 not null 
    ,old_split_basis_type           text                null 
    ,new_split_basis_type           text                null 
    ,old_split_column_type          text                null 
    ,new_split_column_type          text                null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_split_column owner to mj_admin;
go 

grant insert on benefitpoint.audit_split_column to rl_benefitpoint_a;
go 
