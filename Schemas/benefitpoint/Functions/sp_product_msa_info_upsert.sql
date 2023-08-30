create or replace function benefitpoint.sp_product_msa_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.product_msa_info(
		 product_id 
		,account_id 
		,nation_wide 
		,msa_ids 
	) 
	select 	 product_id 
			,account_id 
			,nation_wide::bool 
			,msa_ids 
	from 	benefitpoint.stg_product_msa_info
	on conflict (product_id, account_id) do update 
	set 	 nation_wide 	= excluded.nation_wide 
			,msa_ids 		= excluded.msa_ids 
	where 	(product_msa_info.nation_wide,product_msa_info.msa_ids) 
		is distinct from 	(excluded.nation_wide,excluded.msa_ids); 
	
	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_product_msa_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_product_msa_info_upsert() to rl_benefitpoint_x;
go 