create or replace function benefitpoint.tr_audit_split_payee_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split_payee (
         split_id 
        ,payee_id 
        ,old_commission 
        ,old_override 
        ,old_bonus 
        ,old_bob 
        ,old_sort_order 
        ,old_ignore_split_team 
        ,old_round_to 
        ,old_payee_role_type 
        ,audit_action 
    )
    select   old.split_id 
            ,old.payee_id 
            ,old.commission 
            ,old.override 
            ,old.bonus 
            ,old.bob 
            ,old.sort_order 
            ,old.ignore_split_team 
            ,old.round_to 
            ,old.payee_role_type 
            ,'D'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_payee_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_payee_d() to rl_benefitpoint_x;
go 