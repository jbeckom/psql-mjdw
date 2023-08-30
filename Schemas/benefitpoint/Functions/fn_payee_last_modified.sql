create or replace function benefitpoint.fn_payee_last_modified() 
returns timestamp 
language plpgsql 
as $$ 

begin 
    return (
        select  max(last_modified_on)
        from    benefitpoint.payee 
    );
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.fn_payee_last_modified() owner to mj_admin;
go 

grant execute on function benefitpoint.fn_payee_last_modified() to rl_benefitpoint_x;
go 