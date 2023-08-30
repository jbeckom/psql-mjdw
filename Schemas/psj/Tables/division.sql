create table if not exists psj.division (
     division_number            text            not null 
    ,division_name              bigint          not null            references division_name(name_id) 
    ,segment                    bigint          not null            references division_segment(segment_id)
    ,division_group             bigint          not null            references division_group(group_id)
    ,division_id                bigint          not null            generated always as identity            primary key 
    ,constraint division_number_uq     unique (division_number)
);
go 

/*** PERMISSIONS ***/
alter table psj.division owner to mj_admin;
go 

grant select on psj.division to rl_psj_r;
go 

grant insert on psj.division to rl_psj_a;
go 

grant update on psj.division to rl_psj_w;
go 
