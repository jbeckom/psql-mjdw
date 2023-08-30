create or replace function sagitta.sp_vendors_exp_acct_info_upsert()
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.vendors_exp_acct_info(
		 sagitem 
        ,lis 
        ,vendor_exp_acct_number 
        ,vendor_exp_dept_ind 
	) 
	select 	 sagitem 
			,lis 
			,vendor_exp_acct_number 
			,vendor_exp_dept_ind 
	from 	sagitta.stg_vendors_exp_acct_info
	on conflict (sagitem,lis) do update 
	set 	 vendor_exp_acct_number 	= excluded.vendor_exp_acct_number 
			,vendor_exp_dept_ind 		= excluded.vendor_exp_dept_ind 
	where 	(vendors_exp_acct_info.vendor_exp_acct_number,vendors_exp_acct_info.vendor_exp_dept_ind) 
		is distinct from 	(excluded.vendor_exp_acct_number,excluded.vendor_exp_dept_ind); 
	
	get diagnostics rc = row_count;

	return rc;
end;
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_vendors_exp_acct_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_vendors_exp_acct_info_upsert() to rl_sagitta_x;
go 
