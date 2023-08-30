create or replace function benefitpoint.tr_audit_product_msa_info_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_product_msa_info(
         product_id 
        ,account_id 
        ,old_nation_wide 
        ,new_nation_wide 
        ,old_msa_ids 
        ,new_msa_ids 
        ,audit_action 
    ) 
    select   old.product_id 
            ,old.account_id 
            ,old.nation_wide 
            ,new.nation_wide 
            ,old.msa_ids 
            ,new.msa_ids 
            ,'U';
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_msa_info_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_msa_info_u() to rl_benefitpoint_x;
go