create table sagitta.audit_gs_coverages_glass_info(
     sagitem                                        int             not null 
    ,lis                                            int             not null 
    ,old_glass_item_number                          text            null 
    ,new_glass_item_number                          text            null 
    ,old_glass_location_agency_id                   text            null 
    ,new_glass_location_agency_id                   text            null 
    ,old_glass_sub_location                         text            null 
    ,new_glass_sub_location                         text            null 
    ,old_glass_type_cd                              text            null 
    ,new_glass_type_cd                              text            null 
    ,old_num_plates                                 text            null 
    ,new_num_plates                                 text            null 
    ,old_glass_length_num_units                     text            null 
    ,new_glass_length_num_units                     text            null 
    ,old_glass_width_num_units                      text            null 
    ,new_glass_width_num_units                      text            null 
    ,old_glass_area_num_units                       text            null 
    ,new_glass_area_num_units                       text            null 
    ,old_use_and_position_in_bldg_desc              text            null 
    ,new_use_and_position_in_bldg_desc              text            null 
    ,old_item_desc                                  text            null 
    ,new_item_desc                                  text            null 
    ,old_glass_limit_amt                            text            null 
    ,new_glass_limit_amt                            text            null 
    ,old_safety_glass_ind                           text            null 
    ,new_safety_glass_ind                           text            null 
    ,old_glass_position_and_use_in_bldg_cd          text            null 
    ,new_glass_position_and_use_in_bldg_cd          text            null 
    ,old_glass_linear_length_num_units              text            null 
    ,new_glass_linear_length_num_units              text            null 
    ,old_glass_tenants_exterior_ind                 text            null 
    ,new_glass_tenants_exterior_ind                 text            null 
    ,old_remark_text                                text            null 
    ,new_remark_text                                text            null 
    ,old_glass_bldg_interior_ind                    text            null 
    ,new_glass_bldg_interior_ind                    text            null 
    ,old_glass_bldg_interior_remark_text            text            null 
    ,new_glass_bldg_interior_remark_text            text            null 
    ,old_num_large_replacement_plates               text            null 
    ,new_num_large_replacement_plates               text            null 
    ,audit_action                                   char(1)         not null 
    ,audit_user                                     text            not null            default current_user 
    ,audit_timestamp                                timestamp       not null            default timezone('utc'::text,clock_timestamp()) 
    ,audit_id                                       bigint          not null            generated always as identity            primary key 
);
go 

/*** PERMISSIONS ***/
alter table sagitta.audit_gs_coverages_glass_info owner to mj_admin;
go 

grant insert on sagitta.audit_gs_coverages_glass_info to rl_sagitta_a;
go 
