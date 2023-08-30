create or replace function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gd_coverages_garage_keepers_collision_info (
         sagitem 
        ,lis 
        ,new_garage_keepers_collision_location_number 
        ,new_garagekeeps_collision_limit 
        ,new_garagekeepers_collision_deductible_amt 
        ,new_garage_keepers_collision_num_autos 
        ,new_garage_keepers_collision_premium_amt 
        ,audit_action 
    )
    select   NEW.sagitem 
            ,NEW.lis 
            ,NEW.garage_keepers_collision_location_number 
            ,NEW.garagekeeps_collision_limit 
            ,NEW.garagekeepers_collision_deductible_amt 
            ,NEW.garage_keepers_collision_num_autos 
            ,NEW.garage_keepers_collision_premium_amt 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gd_coverages_garage_keepers_collision_info_i() to rl_sagitta_x;
go 
