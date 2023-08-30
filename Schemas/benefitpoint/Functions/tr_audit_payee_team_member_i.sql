create or replace function benefitpoint.tr_audit_payee_team_member_i() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_payee_team_member (
         payee_id 
        ,team_member_id 
        ,new_commission 
        ,audit_action 
    )
    select   new.payee_id 
            ,new.team_member_id 
            ,new.commission 
            ,'I'; 
    return new;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_payee_team_member_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_payee_team_member_i() to rl_benefitpoint_x;
go 
