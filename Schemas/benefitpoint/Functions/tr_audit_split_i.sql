create or replace function benefitpoint.tr_audit_split_i() 
returns trigger  
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split (
         split_id 
        ,new_product_ids 
        ,new_effective_as_of 
        ,new_notes 
        ,new_last_modified_on 
        ,new_created_on 
        ,audit_action 
    )
    select   new.split_id 
            ,new.product_ids 
            ,new.effective_as_of 
            ,new.notes 
            ,new.last_modified_on 
            ,new.created_on 
            ,'I'; 
    return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_i() to rl_benefitpoint_x;
go 

