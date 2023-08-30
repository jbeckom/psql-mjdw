create or replace function benefitpoint.tr_audit_split_payee_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split_payee (
         split_id 
        ,payee_id 
        ,old_commission 
        ,new_commission 
        ,old_override 
        ,new_override 
        ,old_bonus 
        ,new_bonus 
        ,old_bob 
        ,new_bob 
        ,old_sort_order 
        ,new_sort_order 
        ,old_ignore_split_team 
        ,new_ignore_split_team 
        ,old_round_to 
        ,new_round_to 
        ,old_payee_role_type 
        ,new_payee_role_type 
        ,audit_action 
    )
    select   old.split_id 
            ,old.payee_id 
            ,old.commission 
            ,new.commission 
            ,old.override 
            ,new.override 
            ,old.bonus 
            ,new.bonus 
            ,old.bob 
            ,new.bob 
            ,old.sort_order 
            ,new.sort_order 
            ,old.ignore_split_team 
            ,new.ignore_split_team 
            ,old.round_to 
            ,new.round_to 
            ,old.payee_role_type 
            ,new.payee_role_type 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_payee_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_payee_u() to rl_benefitpoint_x;
go 