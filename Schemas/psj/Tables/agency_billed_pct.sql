create table if not exists psj.agency_billed_pct (
     fiscal_year                   int                         not null 
    ,division_name                 bigint                      not null            references division_name(name_id)
    ,pct                           double precision            not null 
    ,agency_billed_pct_id          bigint                      not null            generated always as identity            primary key 
    ,constraint agency_billed_pct_fiscal_year_division_uq  unique (fiscal_year,division_name)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.agency_billed_pct owner to mj_admin;
go 

grant select on psj.agency_billed_pct to rl_psj_r;
go 

grant insert on psj.agency_billed_pct to rl_psj_a;
go 

grant update on psj.agency_billed_pct to rl_psj_w;
go 
