create table if not exists psj.ledger (
     ledger_number              bigint          not null            primary key 
    ,ledger_name                bigint          not null            references ledger_name(name_id)
    ,ledger_category            bigint          not null            references ledger_category(category_id)
    ,ledger_allocation          bigint          null                references ledger_allocation(allocation_id)
);
go 

/*** PERMISSIONS ***/
alter table psj.ledger owner to mj_admin;
go 

grant select on psj.ledger to rl_psj_r;
go 

grant insert on psj.ledger to rl_psj_a;
go 

grant update on psj.ledger to rl_psj_w;
go 
