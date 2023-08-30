create or replace function benefitpoint.sp_individual_payee_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.individual_payee (
		 payee_id 
        ,tax_status 
        ,company_name 
        ,department_code 
        ,employee_code 
		,agent_account_id 
		,user_id 
	)
	select 	 payee_id 
			,tax_status 
			,company_name 
			,department_code 
			,employee_code 
			,agent_account_id::int 
			,user_id::int 
	from 	benefitpoint.stg_individual_payee 
	on conflict (payee_id) do update 
	set 	 tax_status 		= excluded.tax_status 
			,company_name 		= excluded.company_name 
			,department_code 	= excluded.department_code 
			,employee_code 		= excluded.employee_code 
			,agent_account_id 	= excluded.agent_account_id 
			,user_id 			= excluded.user_id 
	where 	(individual_payee.tax_status,individual_payee.company_name,individual_payee.department_code,individual_payee.employee_code,individual_payee.agent_account_id,individual_payee.user_id) 
		is distinct from 	(excluded.tax_status,excluded.company_name,excluded.department_code,excluded.employee_code,excluded.agent_account_id,excluded.user_id ); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_individual_payee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_individual_payee_upsert() to rl_benefitpoint_x;
go 
