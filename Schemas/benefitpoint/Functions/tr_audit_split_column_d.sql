create or replace function benefitpoint.tr_audit_split_column_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split_column (
         split_id 
        ,split_column_id 
        ,old_split_basis_type 
        ,old_split_column_type 
        ,audit_action 
    )
    select   old.split_id 
            ,old.split_column_id 
            ,old.split_basis_type 
            ,old.split_column_type 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_column_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_column_d() to rl_benefitpoint_x;
go 

