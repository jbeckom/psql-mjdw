create table if not exists psj.division_name (
     name_description           text            not null 
    ,name_id                    bigint          not null            generated always as identity            primary key 
    ,constraint division_name_description_uq     unique (name_description)
);
go 

/*** PERMISSIONS ***/
alter table psj.division_name owner to mj_admin;
go 

grant select on psj.division_name to rl_psj_r;
go 

grant insert on psj.division_name to rl_psj_a;
go 

grant update on psj.division_name to rl_psj_w;
go 
