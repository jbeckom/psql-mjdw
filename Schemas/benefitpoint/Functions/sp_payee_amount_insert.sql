create or replace function benefitpoint.sp_payee_amount_insert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.payee_amount (
		 posting_record_id 
        ,payee_id 
        ,percentage 
        ,amount 
        ,check_number 
        ,check_date 
        ,team_owner_payee_id 
	)
	select 	 posting_record_id 
			,payee_id 
			,percentage 
			,amount 
			,check_number 
			,check_date::timestamp 
			,team_owner_payee_id::int 
	from 	benefitpoint.stg_payee_amount; 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_payee_amount_insert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_payee_amount_insert() to rl_benefitpoint_x;
go 
