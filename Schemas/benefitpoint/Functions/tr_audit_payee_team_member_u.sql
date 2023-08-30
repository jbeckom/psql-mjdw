create or replace function benefitpoint.tr_audit_payee_team_member_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
    insert into benefitpoint.audit_payee_team_member (
         payee_id 
        ,team_member_id 
        ,old_commission 
        ,new_commission 
        ,audit_action 
    )
    select   old.payee_id 
            ,old.team_member_id 
            ,old.commission 
            ,new.commission 
            ,'U'; 
    return old;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_payee_team_member_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_payee_team_member_u() to rl_benefitpoint_x;
go 
