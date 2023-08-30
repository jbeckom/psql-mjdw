create table sagitta.gd_coverages_garage_keepers_collision_info (
     sagitem                                            int             not null 
    ,lis                                                int             not null 
    ,garage_keepers_collision_location_number           text            null 
    ,garagekeeps_collision_limit                        text            null 
    ,garagekeepers_collision_deductible_amt             text            null 
    ,garage_keepers_collision_num_autos                 text            null 
    ,garage_keepers_collision_premium_amt               text            null 
    ,constraint gd_coverages_garage_keepers_collision_info_pkey             primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gd_coverages_garage_keepers_collision_info owner to mj_admin;
go 

grant select on sagitta.gd_coverages_garage_keepers_collision_info to rl_sagitta_r;
go 

grant insert on sagitta.gd_coverages_garage_keepers_collision_info to rl_sagitta_a;
go 

grant update on sagitta.gd_coverages_garage_keepers_collision_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gd_coverages_garage_keepers_collision_info for each row execute function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_d();
go 

create trigger audit_i after insert on sagitta.gd_coverages_garage_keepers_collision_info for each row execute function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_i();
go 

create trigger audit_u after update on sagitta.gd_coverages_garage_keepers_collision_info for each row when (old is distinct from new) execute function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_u();
go 