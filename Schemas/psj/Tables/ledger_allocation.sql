create table if not exists psj.ledger_allocation (
     allocation_description             text            not null 
    ,allocation_id                      bigint          not null            generated always as identity            primary key 
    ,constraint ledger_allocation_description_uq   unique (allocation_description)
);
go 

/*** PERMISSIONS ***/
alter table psj.ledger_allocation owner to mj_admin;
go 

grant select on psj.ledger_allocation to rl_psj_r;
go 

grant insert on psj.ledger_allocation to rl_psj_a;
go 

grant update on psj.ledger_allocation to rl_psj_w;
go 
