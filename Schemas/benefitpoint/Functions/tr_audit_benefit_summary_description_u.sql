create or replace function benefitpoint.tr_audit_benefit_summary_description_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_benefit_summary_description (
         rate_id 
        ,benefit_summary_id 
        ,old_product_id 
        ,new_product_id 
        ,old_description 
        ,new_description 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.benefit_summary_id 
            ,old.product_id 
            ,new.product_id 
            ,old.description 
            ,new.description 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_benefit_summary_description_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_benefit_summary_description_u() to rl_benefitpoint_x;
go 
