create table benefitpoint.audit_payee (
     payee_id                                   int                         not null 
    ,old_payee_type                             text                        null 
    ,new_payee_type                             text                        null 
    ,old_payee_code                             text                        null 
    ,new_payee_code                             text                        null 
    ,old_house_account                          bool                        null 
    ,new_house_account                          bool                        null 
    ,old_tax_payer_id_number                    text                        null 
    ,new_tax_payer_id_number                    text                        null 
    ,old_revenue_goal                           double precision            null 
    ,new_revenue_goal                           double precision            null 
    ,old_commission_goal                        double precision            null 
    ,new_commission_goal                        double precision            null 
    ,old_renewal_revenue_goal                   double precision            null 
    ,new_renewal_revenue_goal                   double precision            null 
    ,old_renewal_commission_goal                double precision            null 
    ,new_renewal_commission_goal                double precision            null 
    ,old_replacement_revenue_goal               double precision            null 
    ,new_replacement_revenue_goal               double precision            null 
    ,old_replacement_commission_goal            double precision            null 
    ,new_replacement_commission_goal            double precision            null 
    ,old_notes                                  text                        null 
    ,new_notes                                  text                        null 
    ,old_include_in_book_of_business            bool                        null 
    ,new_include_in_book_of_business            bool                        null 
    ,old_over_payement_payee                    bool                        null 
    ,new_over_payement_payee                    bool                        null 
    ,old_internal_payee                         bool                        null 
    ,new_internal_payee                         bool                        null 
    ,old_last_modified_on                       timestamp                   null 
    ,new_last_modified_on                       timestamp                   null 
    ,old_created_on                             timestamp                   null 
    ,new_created_on                             timestamp                   null 
    ,audit_action                               char(1)                     not null 
    ,audit_user                                 text                        not null            default current_user 
    ,audit_timestamp                            timestamp                   not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                   bigint                      not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_payee owner to mj_admin;
go 

grant insert on benefitpoint.audit_payee to rl_benefitpoint_a;
go 
