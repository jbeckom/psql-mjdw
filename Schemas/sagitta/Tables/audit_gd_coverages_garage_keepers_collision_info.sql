create table sagitta.audit_gd_coverages_garage_keepers_collision_info (
     sagitem                                                int             not null 
    ,lis                                                    int             not null 
    ,old_garage_keepers_collision_location_number           text            null 
    ,new_garage_keepers_collision_location_number           text            null 
    ,old_garagekeeps_collision_limit                        text            null 
    ,new_garagekeeps_collision_limit                        text            null 
    ,old_garagekeepers_collision_deductible_amt             text            null 
    ,new_garagekeepers_collision_deductible_amt             text            null 
    ,old_garage_keepers_collision_num_autos                 text            null 
    ,new_garage_keepers_collision_num_autos                 text            null 
    ,old_garage_keepers_collision_premium_amt               text            null 
    ,new_garage_keepers_collision_premium_amt               text            null 
    ,audit_action                                           char(1)         not null 
    ,audit_user                                             text            not null            default current_user 
    ,audit_timestamp                                        timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                               bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gd_coverages_garage_keepers_collision_info owner to mj_admin;
go 

grant insert on sagitta.audit_gd_coverages_garage_keepers_collision_info to rl_sagitta_a;
go 