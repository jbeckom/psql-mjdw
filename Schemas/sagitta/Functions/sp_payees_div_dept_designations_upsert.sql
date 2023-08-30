create or replace function sagitta.sp_payees_div_dept_designations_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.payees_div_dept_designations (
		 sagitem
		,lis 
		,valid_div
		,valid_dept
		,limit_new
		,limit_new_date
		,limit_renew
		,limit_renew_date
	)
	select 	 sagitem
			,lis 
			,valid_div
			,valid_dept
			,limit_new
			,limit_new_date
			,limit_renew
			,limit_renew_date
	from 	sagitta.stg_payees_div_dept_designations 
	on conflict (sagitem,lis) do update 
	set 	 valid_div 			= excluded.valid_div
			,valid_dept 		= excluded.valid_dept
			,limit_new 			= excluded.limit_new
			,limit_new_date 	= excluded.limit_new_date
			,limit_renew 		= excluded.limit_renew
			,limit_renew_date 	= excluded.limit_renew_date
	where 	(payees_div_dept_designations.valid_div,payees_div_dept_designations.valid_dept,payees_div_dept_designations.limit_new,payees_div_dept_designations.limit_new_date,payees_div_dept_designations.limit_renew,payees_div_dept_designations.limit_renew_date) 
		is distinct from 	(excluded.valid_div,excluded.valid_dept,excluded.limit_new,excluded.limit_new_date,excluded.limit_renew,excluded.limit_renew_date); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_payees_div_dept_designations_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_payees_div_dept_designations_upsert() to rl_sagitta_x;
go 