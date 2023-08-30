create or replace function sagitta.sp_um_coverages_cov_extension_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.um_coverages_cov_extension_info (
		 sagitem 
		,lis 
		,cov_extension
		,cov_extension_first_limit
		,cov_extension_first_ded
		,cov_extension_second_limit
		,cov_extension_second_ded
		,cov_extension_form
		,cov_extension_edition_date
		,cov_extension_premium
		,cov_extension_description
	)
	select 	 sagitem 
			,lis 
			,cov_extension
			,cov_extension_first_limit
			,cov_extension_first_ded
			,cov_extension_second_limit
			,cov_extension_second_ded
			,cov_extension_form
			,cov_extension_edition_date
			,cov_extension_premium
			,cov_extension_description
	from 	sagitta.stg_um_coverages_cov_extension_info
	on conflict (sagitem,lis) do update 
	set 	 cov_extension 					= excluded.cov_extension
			,cov_extension_first_limit 		= excluded.cov_extension_first_limit
			,cov_extension_first_ded 		= excluded.cov_extension_first_ded
			,cov_extension_second_limit 	= excluded.cov_extension_second_limit
			,cov_extension_second_ded 		= excluded.cov_extension_second_ded
			,cov_extension_form 			= excluded.cov_extension_form
			,cov_extension_edition_date 	= excluded.cov_extension_edition_date
			,cov_extension_premium 			= excluded.cov_extension_premium
			,cov_extension_description 		= excluded.cov_extension_description
	where 	(um_coverages_cov_extension_info.cov_extension,um_coverages_cov_extension_info.cov_extension_first_limit,um_coverages_cov_extension_info.cov_extension_first_ded,um_coverages_cov_extension_info.cov_extension_second_limit,um_coverages_cov_extension_info.cov_extension_second_ded,um_coverages_cov_extension_info.cov_extension_form,um_coverages_cov_extension_info.cov_extension_edition_date,um_coverages_cov_extension_info.cov_extension_premium,um_coverages_cov_extension_info.cov_extension_description) 
		is distinct from 	(excluded.cov_extension,excluded.cov_extension_first_limit,excluded.cov_extension_first_ded,excluded.cov_extension_second_limit,excluded.cov_extension_second_ded,excluded.cov_extension_form,excluded.cov_extension_edition_date,excluded.cov_extension_premium,excluded.cov_extension_description); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_cov_extension_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_cov_extension_info_upsert() to rl_sagitta_x;
go 
