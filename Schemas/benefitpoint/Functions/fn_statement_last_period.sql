create or replace function benefitpoint.fn_statement_last_period ()
returns date 
language plpgsql 
as $$ 

begin 
    return (
        select max(accounting_month)
        from benefitpoint.statement
    );
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.fn_statement_last_period() owner to mj_admin;
go 

grant execute on function benefitpoint.fn_statement_last_period() to rl_benefitpoint_x;
go 
