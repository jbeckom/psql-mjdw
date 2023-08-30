create or replace function sagitta.tr_audit_gs_coverages_glass_info_u()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages_glass_info (
         sagitem 
        ,lis 
        ,old_glass_item_number
        ,new_glass_item_number
        ,old_glass_location_agency_id
        ,new_glass_location_agency_id
        ,old_glass_sub_location
        ,new_glass_sub_location
        ,old_glass_type_cd
        ,new_glass_type_cd
        ,old_num_plates
        ,new_num_plates
        ,old_glass_length_num_units
        ,new_glass_length_num_units
        ,old_glass_width_num_units
        ,new_glass_width_num_units
        ,old_glass_area_num_units
        ,new_glass_area_num_units
        ,old_use_and_position_in_bldg_desc
        ,new_use_and_position_in_bldg_desc
        ,old_item_desc
        ,new_item_desc
        ,old_glass_limit_amt
        ,new_glass_limit_amt
        ,old_safety_glass_ind
        ,new_safety_glass_ind
        ,old_glass_position_and_use_in_bldg_cd
        ,new_glass_position_and_use_in_bldg_cd
        ,old_glass_linear_length_num_units
        ,new_glass_linear_length_num_units
        ,old_glass_tenants_exterior_ind
        ,new_glass_tenants_exterior_ind
        ,old_remark_text
        ,new_remark_text
        ,old_glass_bldg_interior_ind
        ,new_glass_bldg_interior_ind
        ,old_glass_bldg_interior_remark_text
        ,new_glass_bldg_interior_remark_text
        ,old_num_large_replacement_plates 
        ,new_num_large_replacement_plates 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.glass_item_number
            ,new.glass_item_number
            ,old.glass_location_agency_id
            ,new.glass_location_agency_id
            ,old.glass_sub_location
            ,new.glass_sub_location
            ,old.glass_type_cd
            ,new.glass_type_cd
            ,old.num_plates
            ,new.num_plates
            ,old.glass_length_num_units
            ,new.glass_length_num_units
            ,old.glass_width_num_units
            ,new.glass_width_num_units
            ,old.glass_area_num_units
            ,new.glass_area_num_units
            ,old.use_and_position_in_bldg_desc
            ,new.use_and_position_in_bldg_desc
            ,old.item_desc
            ,new.item_desc
            ,old.glass_limit_amt
            ,new.glass_limit_amt
            ,old.safety_glass_ind
            ,new.safety_glass_ind
            ,old.glass_position_and_use_in_bldg_cd
            ,new.glass_position_and_use_in_bldg_cd
            ,old.glass_linear_length_num_units
            ,new.glass_linear_length_num_units
            ,old.glass_tenants_exterior_ind
            ,new.glass_tenants_exterior_ind
            ,old.remark_text
            ,new.remark_text
            ,old.glass_bldg_interior_ind
            ,new.glass_bldg_interior_ind
            ,old.glass_bldg_interior_remark_text
            ,new.glass_bldg_interior_remark_text
            ,old.num_large_replacement_plates 
            ,new.num_large_replacement_plates 
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_glass_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_glass_info_u() to rl_sagitta_x;
go 
