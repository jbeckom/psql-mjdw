create or replace function sagitta.sp_um_coverages_auto_info_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into sagitta.um_coverages_auto_info(
		 sagitem
		,lis 
		,auto_pol_seq
		,auto_pol_number
		,auto_insurer
		,auto_insurer_name
		,auto_effective_date
		,auto_exp_date
		,auto_any_auto_symbol
		,auto_rating_mod
		,auto_csl_limit
		,auto_bi_limit
		,auto_pd_limit
		,auto_csl_ann_prem
		,auto_bi_ann_prem
		,pd_ann_prem
	)
	select 	 sagitem
			,lis 
			,auto_pol_seq
			,auto_pol_number
			,auto_insurer
			,auto_insurer_name
			,auto_effective_date
			,auto_exp_date
			,auto_any_auto_symbol
			,auto_rating_mod
			,auto_csl_limit
			,auto_bi_limit
			,auto_pd_limit
			,auto_csl_ann_prem
			,auto_bi_ann_prem
			,pd_ann_prem
	from 	sagitta.stg_um_coverages_auto_info
	on conflict (sagitem,lis) do update 
	set 	 auto_pol_seq 				= excluded.auto_pol_seq
			,auto_pol_number 			= excluded.auto_pol_number
			,auto_insurer 				= excluded.auto_insurer
			,auto_insurer_name 			= excluded.auto_insurer_name
			,auto_effective_date 		= excluded.auto_effective_date
			,auto_exp_date 				= excluded.auto_exp_date
			,auto_any_auto_symbol 		= excluded.auto_any_auto_symbol
			,auto_rating_mod 			= excluded.auto_rating_mod
			,auto_csl_limit 			= excluded.auto_csl_limit
			,auto_bi_limit 				= excluded.auto_bi_limit
			,auto_pd_limit 				= excluded.auto_pd_limit
			,auto_csl_ann_prem 			= excluded.auto_csl_ann_prem
			,auto_bi_ann_prem 			= excluded.auto_bi_ann_prem
			,pd_ann_prem 				= excluded.pd_ann_prem
	where 	(um_coverages_auto_info.auto_pol_seq,um_coverages_auto_info.auto_pol_number,um_coverages_auto_info.auto_insurer,um_coverages_auto_info.auto_insurer_name,um_coverages_auto_info.auto_effective_date,um_coverages_auto_info.auto_exp_date,um_coverages_auto_info.auto_any_auto_symbol,um_coverages_auto_info.auto_rating_mod,um_coverages_auto_info.auto_csl_limit,um_coverages_auto_info.auto_bi_limit,um_coverages_auto_info.auto_pd_limit,um_coverages_auto_info.auto_csl_ann_prem,um_coverages_auto_info.auto_bi_ann_prem,um_coverages_auto_info.pd_ann_prem) 
		is distinct from 	(excluded.auto_pol_seq,excluded.auto_pol_number,excluded.auto_insurer,excluded.auto_insurer_name,excluded.auto_effective_date,excluded.auto_exp_date,excluded.auto_any_auto_symbol,excluded.auto_rating_mod,excluded.auto_csl_limit,excluded.auto_bi_limit,excluded.auto_pd_limit,excluded.auto_csl_ann_prem,excluded.auto_bi_ann_prem,excluded.pd_ann_prem); 

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_um_coverages_auto_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_um_coverages_auto_info_upsert() to rl_sagitta_x;
go 
