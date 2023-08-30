create table if not exists psj.contingent (
     fiscal_year            int                         not null 
    ,division_name          bigint                      not null            references division_name(name_id)
    ,contingent_amt         int                         not null 
    ,contingent_pct         double precision            not null 
    ,contigent_id           bigint                      not null            generated always as identity            primary key 
    ,constraint contingent_fiscal_year_division_uq     unique (fiscal_year,division_name)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.contingent owner to mj_admin;
go 

grant select on psj.contingent to rl_psj_r;
go 

grant insert on psj.contingent to rl_psj_a;
go 

grant update on psj.contingent to rl_psj_w;
go 
