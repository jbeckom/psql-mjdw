create table benefitpoint.audit_flat_fee (
     commission_id                                          int                         not null 
    ,old_fee                                                double precision            null 
    ,new_fee                                                double precision            null 
    ,old_estimated_number_of_claims                         int                         null 
    ,new_estimated_number_of_claims                         int                         null 
    ,old_estimated_number_of_claims_interval_type           text                        null 
    ,new_estimated_number_of_claims_interval_type           text                        null 
    ,old_fee_interval_type                                  text                        null 
    ,new_fee_interval_type                                  text                        null 
    ,audit_action                                           char(1)                     not null 
    ,audit_user                                             text                        not null            default current_user 
    ,audit_timestamp                                        timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                                               bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_flat_fee owner to mj_admin;
go 

grant insert on benefitpoint.audit_flat_fee to rl_benefitpoint_a;
go 
