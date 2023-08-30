create or replace function sagitta.sp_gs_coverages_glass_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.gs_coverages_glass_info (
         sagitem 
        ,lis 
        ,glass_item_number
        ,glass_location_agency_id
        ,glass_sub_location
        ,glass_type_cd
        ,num_plates
        ,glass_length_num_units
        ,glass_width_num_units
        ,glass_area_num_units
        ,use_and_position_in_bldg_desc
        ,item_desc
        ,glass_limit_amt
        ,safety_glass_ind
        ,glass_position_and_use_in_bldg_cd
        ,glass_linear_length_num_units
        ,glass_tenants_exterior_ind
        ,remark_text
        ,glass_bldg_interior_ind
        ,glass_bldg_interior_remark_text
        ,num_large_replacement_plates 
    )
    select   sagitem 
            ,lis 
            ,glass_item_number
            ,glass_location_agency_id
            ,glass_sub_location
            ,glass_type_cd
            ,num_plates
            ,glass_length_num_units
            ,glass_width_num_units
            ,glass_area_num_units
            ,use_and_position_in_bldg_desc
            ,item_desc
            ,glass_limit_amt
            ,safety_glass_ind
            ,glass_position_and_use_in_bldg_cd
            ,glass_linear_length_num_units
            ,glass_tenants_exterior_ind
            ,remark_text
            ,glass_bldg_interior_ind
            ,glass_bldg_interior_remark_text
            ,num_large_replacement_plates 
    from    sagitta.stg_gs_coverages_glass_info 
    on conflict (sagitem,lis) do update 
    set      glass_item_number                  = excluded.glass_item_number
            ,glass_location_agency_id           = excluded.glass_location_agency_id
            ,glass_sub_location                 = excluded.glass_sub_location
            ,glass_type_cd                      = excluded.glass_type_cd
            ,num_plates                         = excluded.num_plates
            ,glass_length_num_units             = excluded.glass_length_num_units
            ,glass_width_num_units              = excluded.glass_width_num_units
            ,glass_area_num_units               = excluded.glass_area_num_units
            ,use_and_position_in_bldg_desc      = excluded.use_and_position_in_bldg_desc
            ,item_desc                          = excluded.item_desc
            ,glass_limit_amt                    = excluded.glass_limit_amt
            ,safety_glass_ind                   = excluded.safety_glass_ind
            ,glass_position_and_use_in_bldg_cd  = excluded.glass_position_and_use_in_bldg_cd
            ,glass_linear_length_num_units      = excluded.glass_linear_length_num_units
            ,glass_tenants_exterior_ind         = excluded.glass_tenants_exterior_ind
            ,remark_text                        = excluded.remark_text
            ,glass_bldg_interior_ind            = excluded.glass_bldg_interior_ind
            ,glass_bldg_interior_remark_text    = excluded.glass_bldg_interior_remark_text
            ,num_large_replacement_plates       = excluded.num_large_replacement_plates 
    where   (gs_coverages_glass_info.glass_item_number,gs_coverages_glass_info.glass_location_agency_id,gs_coverages_glass_info.glass_sub_location,gs_coverages_glass_info.glass_type_cd,gs_coverages_glass_info.num_plates,gs_coverages_glass_info.glass_length_num_units,gs_coverages_glass_info.glass_width_num_units,gs_coverages_glass_info.glass_area_num_units,gs_coverages_glass_info.use_and_position_in_bldg_desc,gs_coverages_glass_info.item_desc,gs_coverages_glass_info.glass_limit_amt,gs_coverages_glass_info.safety_glass_ind,gs_coverages_glass_info.glass_position_and_use_in_bldg_cd,gs_coverages_glass_info.glass_linear_length_num_units,gs_coverages_glass_info.glass_tenants_exterior_ind,gs_coverages_glass_info.remark_text,gs_coverages_glass_info.glass_bldg_interior_ind,gs_coverages_glass_info.glass_bldg_interior_remark_text,gs_coverages_glass_info.num_large_replacement_plates) 
        is distinct from    (excluded.glass_item_number,excluded.glass_location_agency_id,excluded.glass_sub_location,excluded.glass_type_cd,excluded.num_plates,excluded.glass_length_num_units,excluded.glass_width_num_units,excluded.glass_area_num_units,excluded.use_and_position_in_bldg_desc,excluded.item_desc,excluded.glass_limit_amt,excluded.safety_glass_ind,excluded.glass_position_and_use_in_bldg_cd,excluded.glass_linear_length_num_units,excluded.glass_tenants_exterior_ind,excluded.remark_text,excluded.glass_bldg_interior_ind,excluded.glass_bldg_interior_remark_text,excluded.num_large_replacement_plates ); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gs_coverages_glass_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gs_coverages_glass_info_upsert() to rl_sagitta_x;
go 