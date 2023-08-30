create or replace function benefitpoint.sp_additional_product_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.additional_product_info(
		 product_id 
		,account_id 
		,estimated_commission 
		,commission_period_type 
		,notes 
		,requires_5500 
		,erisa_plan 
		,erisa_plan_year_end_month 
		,erisa_plan_year_end_day 
		,alternative_plan_id 
	)
	select 	 product_id 
			,account_id 
			,estimated_commission::double precision 
			,commission_period_type 
			,notes 
			,requires_5500::bool 
			,erisa_plan 
			,erisa_plan_year_end_month::int 
			,erisa_plan_year_end_day::int 
			,alternative_plan_id::int 
	from 	benefitpoint.stg_additional_product_info 
	on conflict (product_id, account_id) do update 
	set 	 estimated_commission 		= excluded.estimated_commission 
			,commission_period_type 	= excluded.commission_period_type 
			,notes 						= excluded.notes 
			,requires_5500 				= excluded.requires_5500 
			,erisa_plan 				= excluded.erisa_plan 
			,erisa_plan_year_end_month 	= excluded.erisa_plan_year_end_month 
			,erisa_plan_year_end_day 	= excluded.erisa_plan_year_end_day 
			,alternative_plan_id 		= excluded.alternative_plan_id 
	where 	(additional_product_info.estimated_commission,additional_product_info.commission_period_type,additional_product_info.notes,additional_product_info.requires_5500,additional_product_info.erisa_plan,additional_product_info.erisa_plan_year_end_month,additional_product_info.erisa_plan_year_end_day,additional_product_info.alternative_plan_id) 
		is distinct from 	(excluded.estimated_commission,excluded.commission_period_type,excluded.notes,excluded.requires_5500,excluded.erisa_plan,excluded.erisa_plan_year_end_month,excluded.erisa_plan_year_end_day,excluded.alternative_plan_id); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_additional_product_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_additional_product_info_upsert() to rl_benefitpoint_x;
go 