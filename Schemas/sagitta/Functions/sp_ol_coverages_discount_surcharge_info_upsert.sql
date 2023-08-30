create or replace function sagitta.sp_ol_coverages_discount_surcharge_info_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.ol_coverages_discount_surcharge_info(
		 sagitem 
		,lis 
		,discount_surcharge_code
		,discount_surcharge_desc
		,discount_surcharge_rate
		,discount_surcharge_pct
		,discount_surcharge_premium
		,discount_surcharge_remarks
	)
	select 	 sagitem 
			,lis 
			,discount_surcharge_code
			,discount_surcharge_desc
			,discount_surcharge_rate
			,discount_surcharge_pct
			,discount_surcharge_premium
			,discount_surcharge_remarks
	from 	sagitta.stg_ol_coverages_discount_surcharge_info
	on conflict (sagitem,lis) do update 
	set 	 discount_surcharge_code 		= excluded.discount_surcharge_code
			,discount_surcharge_desc 		= excluded.discount_surcharge_desc
			,discount_surcharge_rate 		= excluded.discount_surcharge_rate
			,discount_surcharge_pct 		= excluded.discount_surcharge_pct
			,discount_surcharge_premium 	= excluded.discount_surcharge_premium
			,discount_surcharge_remarks 	= excluded.discount_surcharge_remarks
	where 	(ol_coverages_discount_surcharge_info.discount_surcharge_code,ol_coverages_discount_surcharge_info.discount_surcharge_desc,ol_coverages_discount_surcharge_info.discount_surcharge_rate,ol_coverages_discount_surcharge_info.discount_surcharge_pct,ol_coverages_discount_surcharge_info.discount_surcharge_premium,ol_coverages_discount_surcharge_info.discount_surcharge_remarks) 
		is distinct from 	(excluded.discount_surcharge_code,excluded.discount_surcharge_desc,excluded.discount_surcharge_rate,excluded.discount_surcharge_pct,excluded.discount_surcharge_premium,excluded.discount_surcharge_remarks); 
	
	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_ol_coverages_discount_surcharge_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_ol_coverages_discount_surcharge_info_upsert() to rl_sagitta_x;
go