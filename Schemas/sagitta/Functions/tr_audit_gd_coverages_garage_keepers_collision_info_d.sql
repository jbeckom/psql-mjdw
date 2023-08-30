create or replace function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_garage_keepers_collision_info (
         sagitem 
        ,lis 
        ,old_garage_keepers_collision_location_number 
        ,old_garagekeeps_collision_limit 
        ,old_garagekeepers_collision_deductible_amt 
        ,old_garage_keepers_collision_num_autos 
        ,old_garage_keepers_collision_premium_amt 
        ,audit_action 
    )
    select   OLD.sagitem 
            ,OLD.lis 
            ,OLD.garage_keepers_collision_location_number 
            ,OLD.garagekeeps_collision_limit 
            ,OLD.garagekeepers_collision_deductible_amt 
            ,OLD.garage_keepers_collision_num_autos 
            ,OLD.garage_keepers_collision_premium_amt 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_d() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_d() to rl_sagitta_x;
go 
