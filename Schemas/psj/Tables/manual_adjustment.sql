create table if not exists psj.manual_adjustment (
     period                         date            not null 
    ,division                       bigint          not null            references division(division_id) 
    ,adjustment_category            text            not null 
    ,amount                         int             not null 
    ,manual_adjustment_id           bigint          not null            generated always as identity            primary key 
    ,constraint manual_adjustment_period_division_uq     unique (period,division)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.manual_adjustment owner to mj_admin;
go 

grant select on psj.manual_adjustment to rl_psj_r;
go 

grant insert on psj.manual_adjustment to rl_psj_a;
go 

grant update on psj.manual_adjustment to rl_psj_w;
go 
