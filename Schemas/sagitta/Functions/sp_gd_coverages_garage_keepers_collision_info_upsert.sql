create or replace function sagitta.sp_gd_coverages_garage_keepers_collision_info_upsert ()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.gd_coverages_garage_keepers_collision_info (
         sagitem 
        ,lis 
        ,garage_keepers_collision_location_number 
        ,garagekeeps_collision_limit 
        ,garagekeepers_collision_deductible_amt 
        ,garage_keepers_collision_num_autos 
        ,garage_keepers_collision_premium_amt 
    )
    select   sagitem 
            ,lis 
            ,garage_keepers_collision_location_number 
            ,garagekeeps_collision_limit 
            ,garagekeepers_collision_deductible_amt 
            ,garage_keepers_collision_num_autos 
            ,garage_keepers_collision_premium_amt 
    from    sagitta.stg_gd_coverages_garage_keepers_collision_info 
    on conflict (sagitem,lis) do update 
    set      garage_keepers_collision_location_number   = excluded.garage_keepers_collision_location_number 
            ,garagekeeps_collision_limit                = excluded.garagekeeps_collision_limit 
            ,garagekeepers_collision_deductible_amt     = excluded.garagekeepers_collision_deductible_amt 
            ,garage_keepers_collision_num_autos         = excluded.garage_keepers_collision_num_autos 
            ,garage_keepers_collision_premium_amt       = excluded.garage_keepers_collision_premium_amt 
    where   (gd_coverages_garage_keepers_collision_info.garage_keepers_collision_location_number,gd_coverages_garage_keepers_collision_info.garagekeeps_collision_limit,gd_coverages_garage_keepers_collision_info.garagekeepers_collision_deductible_amt,gd_coverages_garage_keepers_collision_info.garage_keepers_collision_num_autos,gd_coverages_garage_keepers_collision_info.garage_keepers_collision_premium_amt) 
        is distinct from    (excluded.garage_keepers_collision_location_number,excluded.garagekeeps_collision_limit,excluded.garagekeepers_collision_deductible_amt,excluded.garage_keepers_collision_num_autos,excluded.garage_keepers_collision_premium_amt); 
    
    get diagnostics rc = row_count;

    return rc; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gd_coverages_garage_keepers_collision_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gd_coverages_garage_keepers_collision_info_upsert() to rl_sagitta_x;
go 

