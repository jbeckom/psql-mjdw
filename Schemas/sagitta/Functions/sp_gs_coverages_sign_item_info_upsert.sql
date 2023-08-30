create or replace function sagitta.sp_gs_coverages_sign_item_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
    insert into sagitta.gs_coverages_sign_item_info(
         sagitem 
        ,lis 
        ,sign_item_number
        ,sign_location_agency_id
        ,sign_sub_location
        ,inside_outside_sign_cd
        ,sign_limit_amt
        ,sign_deductible
        ,sign_descriptions
        ,sign_1_desc_remark_text
        ,sign_2_desc_remark_text
    )
    select   sagitem 
            ,lis 
            ,sign_item_number
            ,sign_location_agency_id
            ,sign_sub_location
            ,inside_outside_sign_cd
            ,sign_limit_amt
            ,sign_deductible
            ,sign_descriptions
            ,sign_1_desc_remark_text
            ,sign_2_desc_remark_text
    from    sagitta.stg_gs_coverages_sign_item_info 
    on conflict (sagitem,lis) do update 
    set      sign_item_number           = excluded.sign_item_number
            ,sign_location_agency_id    = excluded.sign_location_agency_id
            ,sign_sub_location          = excluded.sign_sub_location
            ,inside_outside_sign_cd     = excluded.inside_outside_sign_cd
            ,sign_limit_amt             = excluded.sign_limit_amt
            ,sign_deductible            = excluded.sign_deductible
            ,sign_descriptions          = excluded.sign_descriptions
            ,sign_1_desc_remark_text    = excluded.sign_1_desc_remark_text
            ,sign_2_desc_remark_text    = excluded.sign_2_desc_remark_text 
    where   (gs_coverages_sign_item_info.sign_item_number,gs_coverages_sign_item_info.sign_location_agency_id,gs_coverages_sign_item_info.sign_sub_location,gs_coverages_sign_item_info.inside_outside_sign_cd,gs_coverages_sign_item_info.sign_limit_amt,gs_coverages_sign_item_info.sign_deductible,gs_coverages_sign_item_info.sign_descriptions,gs_coverages_sign_item_info.sign_1_desc_remark_text,gs_coverages_sign_item_info.sign_2_desc_remark_text) 
        is distinct from    (excluded.sign_item_number,excluded.sign_location_agency_id,excluded.sign_sub_location,excluded.inside_outside_sign_cd,excluded.sign_limit_amt,excluded.sign_deductible,excluded.sign_descriptions,excluded.sign_1_desc_remark_text,excluded.sign_2_desc_remark_text); 

    get diagnostics rc = row_count;

    return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_gs_coverages_sign_item_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_gs_coverages_sign_item_info_upsert() to rl_sagitta_x;
go 
