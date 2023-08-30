drop table if exists psj.ledger_categories;
go 

create table if not exists psj.ledger_categories (
     "number"                       int             not null 
    ,name                           text            not null 
    ,category                       text            not null 
    ,allocation                     text            null 
    ,id                             bigint          not null            generated always as identity            primary key 
    ,constraint ledger_categories_number_uq   unique ("number")
);
go 

/*** PERMISSIONS ***/
alter table psj.ledger_categories owner to mj_admin;
go 

grant select on psj.ledger_categories to rl_psj_r;
go 

grant insert on psj.ledger_categories to rl_psj_a;
go 

grant update on psj.ledger_categories to rl_psj_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on psj.ledger_categories for each row execute function audit.tr_psj_log_change();
go 