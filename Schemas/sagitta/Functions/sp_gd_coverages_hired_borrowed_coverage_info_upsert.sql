create or replace function sagitta.sp_gd_coverages_hired_borrowed_coverage_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.gd_coverages_hired_borrowed_coverage_info (
         sagitem 
        ,lis 
        ,hired_liability_class_cd 
        ,hired_liability_location_number 
        ,hired_liability_state_prov_cd 
        ,hired_liability_cost_amt 
        ,hired_liability_rate 
        ,hired_physical_damage_rate 
        ,if_any_rating_basis_ind 
        ,num_days 
        ,num_vehs 
        ,hired_comprehensive_deductible_amt 
        ,hired_specified_perils_deductible_amt 
        ,hired_collision_deductible_amt 
    )
    select   sagitem 
            ,lis 
            ,hired_liability_class_cd 
            ,hired_liability_location_number 
            ,hired_liability_state_prov_cd 
            ,hired_liability_cost_amt 
            ,hired_liability_rate 
            ,hired_physical_damage_rate 
            ,if_any_rating_basis_ind 
            ,num_days 
            ,num_vehs 
            ,hired_comprehensive_deductible_amt 
            ,hired_specified_perils_deductible_amt 
            ,hired_collision_deductible_amt 
    from    sagitta.stg_gd_coverages_hired_borrowed_coverage_info 
    on conflict (sagitem,lis) do update 
    set      hired_liability_class_cd                       = excluded.hired_liability_class_cd 
            ,hired_liability_location_number                = excluded.hired_liability_location_number 
            ,hired_liability_state_prov_cd                  = excluded.hired_liability_state_prov_cd 
            ,hired_liability_cost_amt                       = excluded.hired_liability_cost_amt 
            ,hired_liability_rate                           = excluded.hired_liability_rate 
            ,hired_physical_damage_rate                     = excluded.hired_physical_damage_rate 
            ,if_any_rating_basis_ind                        = excluded.if_any_rating_basis_ind 
            ,num_days                                       = excluded.num_days 
            ,num_vehs                                       = excluded.num_vehs 
            ,hired_comprehensive_deductible_amt             = excluded.hired_comprehensive_deductible_amt 
            ,hired_specified_perils_deductible_amt          = excluded.hired_specified_perils_deductible_amt 
            ,hired_collision_deductible_amt                 = excluded.hired_collision_deductible_amt 
    where   (gd_coverages_hired_borrowed_coverage_info.hired_liability_class_cd,gd_coverages_hired_borrowed_coverage_info.hired_liability_location_number,gd_coverages_hired_borrowed_coverage_info.hired_liability_state_prov_cd,gd_coverages_hired_borrowed_coverage_info.hired_liability_cost_amt,gd_coverages_hired_borrowed_coverage_info.hired_liability_rate,gd_coverages_hired_borrowed_coverage_info.hired_physical_damage_rate,gd_coverages_hired_borrowed_coverage_info.if_any_rating_basis_ind,gd_coverages_hired_borrowed_coverage_info.num_days,gd_coverages_hired_borrowed_coverage_info.num_vehs,gd_coverages_hired_borrowed_coverage_info.hired_comprehensive_deductible_amt,gd_coverages_hired_borrowed_coverage_info.hired_specified_perils_deductible_amt) 
        is distinct from    (excluded.hired_liability_class_cd,excluded.hired_liability_location_number,excluded.hired_liability_state_prov_cd,excluded.hired_liability_cost_amt,excluded.hired_liability_rate,excluded.hired_physical_damage_rate,excluded.if_any_rating_basis_ind,excluded.num_days,excluded.num_vehs,excluded.hired_comprehensive_deductible_amt,excluded.hired_specified_perils_deductible_amt); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gd_coverages_hired_borrowed_coverage_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gd_coverages_hired_borrowed_coverage_info_upsert() to rl_sagitta_x;
go 