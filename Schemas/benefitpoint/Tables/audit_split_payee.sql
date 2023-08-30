create table benefitpoint.audit_split_payee (
     split_id                       int                         not null 
    ,payee_id                       int                         not null 
    ,old_commission                double precision            null 
    ,new_commission                double precision            null 
    ,old_override                   double precision            null 
    ,new_override                   double precision            null 
    ,old_bonus                      double precision            null 
    ,new_bonus                      double precision            null 
    ,old_bob                        double precision            null 
    ,new_bob                        double precision            null 
    ,old_sort_order                 int                         null 
    ,new_sort_order                 int                         null 
    ,old_ignore_split_team          bool                        null 
    ,new_ignore_split_team          bool                        null 
    ,old_round_to                   bool                        null 
    ,new_round_to                   bool                        null 
    ,old_payee_role_type            text                        null 
    ,new_payee_role_type            text                        null 
    ,audit_action                   char(1)                     not null 
    ,audit_user                     text                        not null            default current_user 
    ,audit_timestamp                timestamp                   not null            default timezone('utc'::text, clock_timestamp()) 
    ,audit_id                       bigint                      not null            generated always as identity 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_split_payee owner to mj_admin;
go 

grant insert on benefitpoint.audit_split_payee to rl_benefitpoint_a;
go 
