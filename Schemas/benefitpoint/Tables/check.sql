create table benefitpoint.check (
     statement_id           int                 not null 
    ,check_number           text                null 
    ,check_date             timestamp           null 
    ,deposit_date           timestamp           null 
    ,payable_to             text                null 
    ,issued_by              text                null 
    ,amount                 decimal             null 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.check owner to mj_admin;
go 

grant select on benefitpoint.check to rl_benefitpoint_r;
go 

grant insert on benefitpoint.check to rl_benefitpoint_a;
go 