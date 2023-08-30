create or replace function benefitpoint.tr_audit_split_d() 
returns trigger  
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split (
         split_id 
        ,old_product_ids 
        ,old_effective_as_of 
        ,old_notes 
        ,old_last_modified_on 
        ,old_created_on 
        ,audit_action 
    )
    select   old.split_id 
            ,old.product_ids 
            ,old.effective_as_of 
            ,old.notes 
            ,old.last_modified_on 
            ,old.created_on 
            ,'D'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_d() to rl_benefitpoint_x;
go 

