create or replace function benefitpoint.tr_audit_product_msa_info_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_product_msa_info(
         product_id 
        ,account_id 
        ,new_nation_wide 
        ,new_msa_ids 
        ,audit_action 
    ) 
    select   new.product_id 
            ,new.account_id 
            ,new.nation_wide 
            ,new.msa_ids 
            ,'I';
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_msa_info_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_msa_info_i() to rl_benefitpoint_x;
go