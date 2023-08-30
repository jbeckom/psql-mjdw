drop table if exists psj.producer_divisions;
go 

create table if not exists psj.producer_divisions (
     "number"                       char(3)             not null 
    ,name                           text                not null 
    ,segment                        text                not null 
    ,"group"                        text                not null 
    ,id                             bigint              not null            generated always as identity            primary key 
    ,constraint producer_divisions_number_uq     unique ("number")
);
go 

/*** PERMISSIONS ***/
alter table psj.producer_divisions owner to mj_admin;
go 

grant select on psj.producer_divisions to rl_psj_r;
go 

grant insert on psj.producer_divisions to rl_psj_a;
go 

grant update on psj.producer_divisions to rl_psj_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on psj.producer_divisions for each row execute function audit.tr_psj_log_change();
go 