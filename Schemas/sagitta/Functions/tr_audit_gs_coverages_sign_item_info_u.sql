create or replace function sagitta.tr_audit_gs_coverages_sign_item_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages_sign_item_info (
         sagitem 
        ,lis 
        ,old_sign_item_number 
        ,new_sign_item_number 
        ,old_sign_location_agency_id 
        ,new_sign_location_agency_id 
        ,old_sign_sub_location 
        ,new_sign_sub_location 
        ,old_inside_outside_sign_cd 
        ,new_inside_outside_sign_cd 
        ,old_sign_limit_amt 
        ,new_sign_limit_amt 
        ,old_sign_deductible 
        ,new_sign_deductible 
        ,old_sign_descriptions 
        ,new_sign_descriptions 
        ,old_sign_1_desc_remark_text 
        ,new_sign_1_desc_remark_text 
        ,old_sign_2_desc_remark_text 
        ,new_sign_2_desc_remark_text 
        ,audit_action 
    )
    select   old.sagitem 
            ,old.lis 
            ,old.sign_item_number 
            ,new.sign_item_number 
            ,old.sign_location_agency_id 
            ,new.sign_location_agency_id 
            ,old.sign_sub_location 
            ,new.sign_sub_location 
            ,old.inside_outside_sign_cd 
            ,new.inside_outside_sign_cd 
            ,old.sign_limit_amt 
            ,new.sign_limit_amt 
            ,old.sign_deductible 
            ,new.sign_deductible 
            ,old.sign_descriptions 
            ,new.sign_descriptions 
            ,old.sign_1_desc_remark_text 
            ,new.sign_1_desc_remark_text 
            ,old.sign_2_desc_remark_text 
            ,new.sign_2_desc_remark_text 
            ,'U';
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_sign_item_info_u() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_sign_item_info_u() to rl_sagitta_x;
go 
