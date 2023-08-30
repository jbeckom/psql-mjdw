create or replace function sagitta.tr_audit_gs_coverages_sign_item_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into sagitta.audit_gs_coverages_sign_item_info (
         sagitem 
        ,lis 
        ,new_sign_item_number
        ,new_sign_location_agency_id
        ,new_sign_sub_location
        ,new_inside_outside_sign_cd
        ,new_sign_limit_amt
        ,new_sign_deductible
        ,new_sign_descriptions
        ,new_sign_1_desc_remark_text
        ,new_sign_2_desc_remark_text
        ,audit_action 
    )
    select   new.sagitem 
            ,new.lis 
            ,new.sign_item_number
            ,new.sign_location_agency_id
            ,new.sign_sub_location
            ,new.inside_outside_sign_cd
            ,new.sign_limit_amt
            ,new.sign_deductible
            ,new.sign_descriptions
            ,new.sign_1_desc_remark_text
            ,new.sign_2_desc_remark_text
            ,'I';
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.tr_audit_gs_coverages_sign_item_info_i() owner to mj_admin;
go 

grant execute on function sagitta.tr_audit_gs_coverages_sign_item_info_i() to rl_sagitta_x;
go 
