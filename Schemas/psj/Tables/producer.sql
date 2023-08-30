create table if not exists psj.producer (
     producer_name          text            not null 
    ,active                 bool            not null 
    ,status                 text            null        -- should this be constrained?
    ,start_date             date            null 
    ,producer_id            bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table psj.producer owner to mj_admin;
go 

grant select on psj.producer to rl_psj_r;
go 

grant insert on psj.producer to rl_psj_a;
go 

grant update on psj.producer to rl_psj_w;
go 
