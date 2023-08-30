create or replace function sagitta.sp_chart_of_accounts_master_allocation_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.chart_of_accounts_master_allocation_info (
		 sagitem 
        ,alloc_gl_acct_number 
        ,allocation_pct 
	)
	select 	 sagitem 
			,alloc_gl_acct_number 
			,allocation_pct 
	from 	sagitta.stg_chart_of_accounts_master_allocation_info 
	on conflict (sagitem) do update 
	set 	 alloc_gl_acct_number 	= excluded.alloc_gl_acct_number 
        	,allocation_pct 		= excluded.allocation_pct 
	where 	(chart_of_accounts_master_allocation_info.alloc_gl_acct_number,chart_of_accounts_master_allocation_info.allocation_pct) 
		is distinct from 	(excluded.alloc_gl_acct_number,excluded.allocation_pct); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_chart_of_accounts_master_allocation_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_chart_of_accounts_master_allocation_info_upsert() to rl_sagitta_x;
go 