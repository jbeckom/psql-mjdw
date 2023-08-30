create or replace function benefitpoint.tr_audit_split_payee_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_split_payee (
         split_id 
        ,payee_id 
        ,new_commission 
        ,new_override 
        ,new_bonus 
        ,new_bob 
        ,new_sort_order 
        ,new_ignore_split_team 
        ,new_round_to 
        ,new_payee_role_type 
        ,audit_action 
    )
    select   new.split_id 
            ,new.payee_id 
            ,new.commission 
            ,new.override 
            ,new.bonus 
            ,new.bob 
            ,new.sort_order 
            ,new.ignore_split_team 
            ,new.round_to 
            ,new.payee_role_type 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_split_payee_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_split_payee_i() to rl_benefitpoint_x;
go 