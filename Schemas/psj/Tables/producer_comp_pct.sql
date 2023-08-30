create table if not exists psj.producer_comp_pct (
     period                         date                        not null            
    ,division                       bigint                      not null            references division(division_id) 
    ,rate                           double precision            not null 
    ,fiscal_year                    int                         not null            -- can be derived from period, is it necessary to store?
    ,producer_comp_pct_id           bigint                      not null            generated always as identity            primary key 
    ,constraint producer_comp_pct_period_division_uq     unique (period,division)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.producer_comp_pct owner to mj_admin;
go 

grant select on psj.producer_comp_pct to rl_psj_r;
go 

grant insert on psj.producer_comp_pct to rl_psj_a;
go 

grant update on psj.producer_comp_pct to rl_psj_w;
go 
