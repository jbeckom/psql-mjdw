create table benefitpoint.payee (
     payee_id                               int                         not null 
    ,payee_type                             text                        null 
    ,payee_code                             text                        null 
    ,house_account                          bool                        null 
    ,tax_payer_id_number                    text                        null 
    ,revenue_goal                           double precision            null 
    ,commission_goal                        double precision            null 
    ,renewal_revenue_goal                   double precision            null 
    ,renewal_commission_goal                double precision            null 
    ,replacement_revenue_goal               double precision            null 
    ,replacement_commission_goal            double precision            null 
    ,notes                                  text                        null 
    ,include_in_book_of_business            bool                        null 
    ,over_payement_payee                    bool                        null 
    ,internal_payee                         bool                        null 
    ,last_modified_on                       timestamp                   null 
    ,created_on                             timestamp                   null 
    ,constraint payee_pkey  primary key (payee_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.payee owner to mj_admin;
go 

grant select on benefitpoint.payee to rl_benefitpoint_r;
go 

grant insert on benefitpoint.payee to rl_benefitpoint_a;
go 

grant update on benefitpoint.payee to rl_benefitpoint_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on benefitpoint.payee for each row execute function benefitpoint.tr_audit_payee_d();
go 

create trigger audit_i after insert on benefitpoint.payee for each row execute function benefitpoint.tr_audit_payee_i();
go 

create trigger audit_u after update on benefitpoint.payee for each row when (old is distinct from new) execute function benefitpoint.tr_audit_payee_u();
go 