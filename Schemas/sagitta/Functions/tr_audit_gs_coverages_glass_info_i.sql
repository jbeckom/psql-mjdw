create or replace function sagitta.tr_audit_gs_coverages_glass_info_i()
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages_glass_info (
         sagitem 
        ,lis 
        ,new_glass_item_number
        ,new_glass_location_agency_id
        ,new_glass_sub_location
        ,new_glass_type_cd
        ,new_num_plates
        ,new_glass_length_num_units
        ,new_glass_width_num_units
        ,new_glass_area_num_units
        ,new_use_and_position_in_bldg_desc
        ,new_item_desc
        ,new_glass_limit_amt
        ,new_safety_glass_ind
        ,new_glass_position_and_use_in_bldg_cd
        ,new_glass_linear_length_num_units
        ,new_glass_tenants_exterior_ind
        ,new_remark_text
        ,new_glass_bldg_interior_ind
        ,new_glass_bldg_interior_remark_text
        ,new_num_large_replacement_plates 
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.glass_item_number
            ,new.glass_location_agency_id
            ,new.glass_sub_location
            ,new.glass_type_cd
            ,new.num_plates
            ,new.glass_length_num_units
            ,new.glass_width_num_units
            ,new.glass_area_num_units
            ,new.use_and_position_in_bldg_desc
            ,new.item_desc
            ,new.glass_limit_amt
            ,new.safety_glass_ind
            ,new.glass_position_and_use_in_bldg_cd
            ,new.glass_linear_length_num_units
            ,new.glass_tenants_exterior_ind
            ,new.remark_text
            ,new.glass_bldg_interior_ind
            ,new.glass_bldg_interior_remark_text
            ,new.num_large_replacement_plates 
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_glass_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_glass_info_i() to rl_sagitta_x;
go 
