create table if not exists psj.division_segment (
     segment_description            text            not null 
    ,segment_id                     bigint          not null            generated always as identity            primary key 
    ,constraint division_segment_description_uq   unique (segment_description)
);
go 

/*** PERMISSIONS ***/
alter table psj.division_segment owner to mj_admin;
go 

grant select on psj.division_segment to rl_psj_r;
go 

grant insert on psj.division_segment to rl_psj_a;
go 

grant update on psj.division_segment to rl_psj_w;
go 
