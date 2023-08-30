create or replace function benefitpoint.tr_audit_benefit_summary_description_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_benefit_summary_description (
         rate_id 
        ,benefit_summary_id 
        ,new_product_id 
        ,new_description 
        ,audit_action 
    )
    select   new.rate_id 
            ,new.benefit_summary_id 
            ,new.product_id 
            ,new.description 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_benefit_summary_description_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_benefit_summary_description_i() to rl_benefitpoint_x;
go 
