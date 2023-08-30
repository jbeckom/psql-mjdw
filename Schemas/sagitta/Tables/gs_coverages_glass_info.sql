create table sagitta.gs_coverages_glass_info(
     sagitem                                    int             not null 
    ,lis                                        int             not null 
    ,glass_item_number                          text            null 
    ,glass_location_agency_id                   text            null 
    ,glass_sub_location                         text            null 
    ,glass_type_cd                              text            null 
    ,num_plates                                 text            null 
    ,glass_length_num_units                     text            null 
    ,glass_width_num_units                      text            null 
    ,glass_area_num_units                       text            null 
    ,use_and_position_in_bldg_desc              text            null 
    ,item_desc                                  text            null 
    ,glass_limit_amt                            text            null 
    ,safety_glass_ind                           text            null 
    ,glass_position_and_use_in_bldg_cd          text            null 
    ,glass_linear_length_num_units              text            null 
    ,glass_tenants_exterior_ind                 text            null 
    ,remark_text                                text            null 
    ,glass_bldg_interior_ind                    text            null 
    ,glass_bldg_interior_remark_text            text            null 
    ,num_large_replacement_plates               text            null 
    ,constraint gs_coverages_glass_info_pkey    primary key (sagitem,lis)
);
go 

/*** PERMISSIONS ***/
alter table sagitta.gs_coverages_glass_info owner to mj_admin;
go 

grant select on sagitta.gs_coverages_glass_info to rl_sagitta_r;
go 

grant insert on sagitta.gs_coverages_glass_info to rl_sagitta_a;
go 

grant update on sagitta.gs_coverages_glass_info to rl_sagitta_w;
go 

/*** TRIGGERS ***/
create trigger audit_d after delete on sagitta.gs_coverages_glass_info for each row execute function sagitta.tr_audit_gs_coverages_glass_info_d();
go 

create trigger audit_i after insert on sagitta.gs_coverages_glass_info for each row execute function sagitta.tr_audit_gs_coverages_glass_info_i();
go 

create trigger audit_u after update on sagitta.gs_coverages_glass_info for each row execute function sagitta.tr_audit_gs_coverages_glass_info_u();
go 