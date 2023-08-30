create or replace function benefitpoint.sp_benefit_summary_description_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin
	insert into benefitpoint.benefit_summary_description (
		 rate_id 
        ,benefit_summary_id 
        ,product_id 
        ,description 
	)
	select 	 rate_id 
			,benefit_summary_id 
			,product_id 
			,description 
	from benefitpoint.stg_benefit_summary_description 
	on conflict (rate_id, benefit_summary_id) do update 
	set 	 product_id 	= excluded.product_id 
			,description 	= excluded.description 
	where 	(benefit_summary_description.product_id,benefit_summary_description.description) 
		is distinct from (excluded.product_id,excluded.description); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_benefit_summary_description_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_benefit_summary_description_upsert() to rl_benefitpoint_x;
go 
