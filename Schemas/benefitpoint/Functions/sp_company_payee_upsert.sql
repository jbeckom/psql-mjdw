create or replace function benefitpoint.sp_company_payee_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int ;

begin 
	insert into benefitpoint.company_payee (
		 payee_id 
        ,company_name 
        ,vendor_number 
        ,website 
		,agency_account_id 
		,company_1099 
		
	)
	select 	 payee_id 
			,company_name 
			,vendor_number 
			,website 
			,agency_account_id::int 
			,company_1099::bool  
	from 	benefitpoint.stg_company_payee
	on conflict (payee_id) do update 
	set  company_name 		= excluded.company_name 
		,vendor_number 		= excluded.vendor_number 
		,website 			= excluded.website 
		,agency_account_id 	= excluded.agency_account_id 
		,company_1099 		= excluded.company_1099 
	where 	(company_payee.company_name,company_payee.vendor_number,company_payee.website,company_payee.agency_account_id,company_payee.company_1099) 
		is distinct from 	(excluded.company_name,excluded.vendor_number,excluded.website,excluded.agency_account_id,excluded.company_1099); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_company_payee_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_company_payee_upsert() to rl_benefitpoint_x;
go 