create table if not exists psj.agency_billed_pcts (
     fiscal_year                    int                         not null 
    ,division                       text                        not null    -- this should reference master data 
    ,percent                        double precision            not null 
    ,agency_billed_pcts_id          bigint                      not null            generated always as identity            primary key 
    ,constraint agency_billed_pcts_fiscal_year_division_uq  unique (fiscal_year,division)   -- can this be constrained in another way?
);
go 

/*** PERMISSIONS ***/
alter table psj.agency_billed_pcts owner to mj_admin;
go 

grant select on psj.agency_billed_pcts to rl_psj_r;
go 

grant insert on psj.agency_billed_pcts to rl_psj_a;
go 

grant update on psj.agency_billed_pcts to rl_psj_w;
go 
