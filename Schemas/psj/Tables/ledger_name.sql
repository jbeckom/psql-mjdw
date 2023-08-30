create table if not exists psj.ledger_name (
     name_description           text            not null 
    ,name_id                    bigint          not null            generated always as identity            primary key 
    ,constraint ledger_name_description_uq   unique (name_description)
);
go 

/*** PERMISSIONS ***/
alter table psj.ledger_name owner to mj_admin;
go 

grant select on psj.ledger_name to rl_psj_r;
go 

grant insert on psj.ledger_name to rl_psj_a;
go 

grant update on psj.ledger_name to rl_psj_w;
go 
