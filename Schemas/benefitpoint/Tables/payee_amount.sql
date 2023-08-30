create table benefitpoint.payee_amount (
     posting_record_id              int                         not null 
    ,payee_id                       int                         not null 
    ,percentage                     double precision            null 
    ,amount                         double precision            null 
    ,check_number                   text                        null 
    ,check_date                     timestamp                   null 
    ,team_owner_payee_id            int                         null 
    ,constraint payee_amount_pkey  primary key (posting_record_id, payee_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.payee_amount owner to mj_admin;
go 

grant select on benefitpoint.payee_amount to rl_benefitpoint_r;
go 

grant insert on benefitpoint.payee_amount to rl_benefitpoint_a;
go 
