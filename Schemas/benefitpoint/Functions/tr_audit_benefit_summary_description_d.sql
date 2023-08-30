create or replace function benefitpoint.tr_audit_benefit_summary_description_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_benefit_summary_description (
         rate_id 
        ,benefit_summary_id 
        ,old_product_id 
        ,old_description 
        ,audit_action 
    )
    select   old.rate_id 
            ,old.benefit_summary_id 
            ,old.product_id 
            ,old.description 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_benefit_summary_description_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_benefit_summary_description_d() to rl_benefitpoint_x;
go 
