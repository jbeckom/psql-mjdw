create table benefitpoint.audit_split (
     split_id                       int                 not null 
    ,old_product_ids                text                null 
    ,new_product_ids                text                null 
    ,old_effective_as_of            timestamp           null 
    ,new_effective_as_of            timestamp           null 
    ,old_notes                      text                null 
    ,new_notes                      text                null 
    ,old_last_modified_on           timestamp           null 
    ,new_last_modified_on           timestamp           null 
    ,old_created_on                 timestamp           null 
    ,new_created_on                 timestamp           null 
    ,audit_action                   char(1)             not null 
    ,audit_user                     text                not null            default current_user 
    ,audit_timestamp                timestamp           not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint              not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_split owner to mj_admin;
go 

grant insert on benefitpoint.audit_split to rl_benefitpoint_a;
go 
