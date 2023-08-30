create or replace function benefitpoint.tfn_statement_entry_per_accounting_month(accountingMonth date) 
returns table (statement_id int, product_id int) 
language plpgsql 
as $$ 

BEGIN
    return query 
    SELECT DISTINCT 
		      s.statement_id, se.product_id
    FROM 	benefitpoint."statement" AS s 
        INNER JOIN benefitpoint.statement_entry AS se
            ON se.statement_id = s.statement_id
    WHERE 	s.accounting_month = accountingMonth;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tfn_statement_entry_per_accounting_month(accountingMonth date) owner to mj_admin;
go 

grant execute on function benefitpoint.tfn_statement_entry_per_accounting_month(accountingMonth date) to rl_benefitpoint_x;
go 