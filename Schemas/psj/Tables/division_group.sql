create table if not exists psj.division_group (
     group_description          text            not null 
    ,group_id                   bigint          not null            generated always as identity            primary key 
    ,constraint division_group_description_uq   unique (group_description)
);
go 

/*** PERMISSIONS ***/
alter table psj.division_group owner to mj_admin;
go 

grant select on psj.division_group to rl_psj_r;
go 

grant insert on psj.division_group to rl_psj_a;
go 

grant update on psj.division_group to rl_psj_w;
go 
