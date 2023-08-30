create or replace function benefitpoint.tr_audit_split_u() 
returns trigger  
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split (
         split_id 
        ,old_product_ids 
        ,new_product_ids 
        ,old_effective_as_of 
        ,new_effective_as_of 
        ,old_notes 
        ,new_notes 
        ,old_last_modified_on 
        ,new_last_modified_on 
        ,old_created_on 
        ,new_created_on 
        ,audit_action 
    )
    select   old.split_id 
            ,old.product_ids 
            ,new.product_ids 
            ,old.effective_as_of 
            ,new.effective_as_of 
            ,old.notes 
            ,new.notes 
            ,old.last_modified_on 
            ,new.last_modified_on 
            ,old.created_on 
            ,new.created_on 
            ,'U'; 
    return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_u() to rl_benefitpoint_x;
go 

