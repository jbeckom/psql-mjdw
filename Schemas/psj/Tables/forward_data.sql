create table if not exists psj.forward_data (
     period                         date                        not null 
    ,division_name                  bigint                      not null            references division_name(name_id)
    ,division                       bigint                      not null            references division(division_id)
    ,if_rev                         int                         null 
    ,var_fixed                      int                         null 
    ,fixed_cost_adjustment          int                         null 
    ,producer_compensation          double precision            null 
    ,forward_data_id                bigint                      not null            generated always as identity            primary key 
    ,constraint forward_data_period_division_uq     unique (period,division)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.forward_data owner to mj_admin;
go 

grant select on psj.forward_data to rl_psj_r;
go 

grant insert on psj.forward_data to rl_psj_a;
go 

grant update on psj.forward_data to rl_psj_w;
go 
