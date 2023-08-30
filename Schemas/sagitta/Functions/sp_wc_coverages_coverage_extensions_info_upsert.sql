create or replace function sagitta.sp_wc_coverages_coverage_extensions_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into sagitta.wc_coverages_coverage_extensions_info (
		 sagitem 
		,lis 
		,coverage_cd
		,state_prov_cd
		,form_number
		,edition_dt
		,first_ea_accident_bi_limit
		,second_bi_by_disease_limit
		,third_per_employee_by_bi_limit
		,coverage_extention_annual_premium_amt
		,coverage_desc
		,location_number
		,type_cd
		,deductible_1_amt
		,deductible_2_amt
		,deductible_1_type_cd 
		,deductible_2_type_cd 
		,rate
	)
	select 	 sagitem 
			,lis 
			,coverage_cd
			,state_prov_cd
			,form_number
			,edition_dt
			,first_ea_accident_bi_limit
			,second_bi_by_disease_limit
			,third_per_employee_by_bi_limit
			,coverage_extention_annual_premium_amt
			,coverage_desc
			,location_number
			,type_cd
			,deductible_1_amt
			,deductible_2_amt
			,deductible_1_type_cd 
			,deductible_2_type_cd 
			,rate
	from 	sagitta.stg_wc_coverages_coverage_extensions_info 
	on conflict (sagitem,lis) do update 
	set 	 coverage_cd 							= excluded.coverage_cd
			,state_prov_cd 							= excluded.state_prov_cd
			,form_number 							= excluded.form_number
			,edition_dt 							= excluded.edition_dt
			,first_ea_accident_bi_limit 			= excluded.first_ea_accident_bi_limit
			,second_bi_by_disease_limit 			= excluded.second_bi_by_disease_limit
			,third_per_employee_by_bi_limit 		= excluded.third_per_employee_by_bi_limit
			,coverage_extention_annual_premium_amt 	= excluded.coverage_extention_annual_premium_amt
			,coverage_desc 							= excluded.coverage_desc
			,location_number 						= excluded.location_number
			,type_cd 								= excluded.type_cd
			,deductible_1_amt 						= excluded.deductible_1_amt
			,deductible_2_amt 						= excluded.deductible_2_amt
			,deductible_1_type_cd  					= excluded.deductible_1_type_cd 
			,deductible_2_type_cd  					= excluded.deductible_2_type_cd 
			,rate 									= excluded.rate 
	where 	(wc_coverages_coverage_extensions_info.coverage_cd,wc_coverages_coverage_extensions_info.state_prov_cd,wc_coverages_coverage_extensions_info.form_number,wc_coverages_coverage_extensions_info.edition_dt,wc_coverages_coverage_extensions_info.first_ea_accident_bi_limit,wc_coverages_coverage_extensions_info.second_bi_by_disease_limit,wc_coverages_coverage_extensions_info.third_per_employee_by_bi_limit,wc_coverages_coverage_extensions_info.coverage_extention_annual_premium_amt,wc_coverages_coverage_extensions_info.coverage_desc,wc_coverages_coverage_extensions_info.location_number,wc_coverages_coverage_extensions_info.type_cd,wc_coverages_coverage_extensions_info.deductible_1_amt,wc_coverages_coverage_extensions_info.deductible_2_amt,wc_coverages_coverage_extensions_info.deductible_1_type_cd ,wc_coverages_coverage_extensions_info.deductible_2_type_cd ,wc_coverages_coverage_extensions_info.rate) 
		is distinct from 	(excluded.coverage_cd,excluded.state_prov_cd,excluded.form_number,excluded.edition_dt,excluded.first_ea_accident_bi_limit,excluded.second_bi_by_disease_limit,excluded.third_per_employee_by_bi_limit,excluded.coverage_extention_annual_premium_amt,excluded.coverage_desc,excluded.location_number,excluded.type_cd,excluded.deductible_1_amt,excluded.deductible_2_amt,excluded.deductible_1_type_cd ,excluded.deductible_2_type_cd ,excluded.rate); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function sagitta.sp_wc_coverages_coverage_extensions_info_upsert() owner to mj_admin;
go 

grant execute on function sagitta.sp_wc_coverages_coverage_extensions_info_upsert() to rl_sagitta_x;
go 