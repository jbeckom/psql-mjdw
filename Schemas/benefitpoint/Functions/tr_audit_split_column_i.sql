create or replace function benefitpoint.tr_audit_split_column_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split_column (
         split_id 
        ,split_column_id 
        ,new_split_basis_type 
        ,new_split_column_type 
        ,audit_action 
    )
    select   new.split_id 
            ,new.split_column_id 
            ,new.split_basis_type 
            ,new.split_column_type 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_column_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_column_i() to rl_benefitpoint_x;
go 

