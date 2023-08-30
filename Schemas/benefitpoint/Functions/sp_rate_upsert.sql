create or replace function benefitpoint.sp_rate_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.rate(
		 rate_id 
        ,product_id 
        ,response_id 
        ,description 
        ,rate_type_id 
        ,rate_type_tier_id 
        ,effective_as_of 
        ,expiration_on 
        ,include_ee 
        ,age_banded 
        ,age_banded_start_on 
        ,age_banded_end_on 
        ,age_banded_interval 
        ,age_banded_gender_specific 
        ,rating_method 
        ,estimated_monthly_premium
        ,estimated_monthly_revenue
        ,additional_info
        ,rate_guarantee
        ,rate_guarantee_uom
        ,number_of_lives_as_of
        ,payment_cycle
        ,renewal_percentage_change
        ,last_modified_on
        ,created_on
	)
	select 	 rate_id 
			,product_id 
			,response_id::int 
			,description 
			,rate_type_id 
			,rate_type_tier_id 
			,effective_as_of::timestamp 
			,expiration_on::timestamp 
			,include_ee::bool 
			,age_banded::bool 
			,age_banded_start_on::int 
			,age_banded_end_on::int 
			,age_banded_interval::int 
			,age_banded_gender_specific::bool 
			,rating_method 
			,estimated_monthly_premium::double precision 
			,estimated_monthly_revenue::double precision 
			,additional_info 
			,rate_guarantee::int 
			,rate_guarantee_uom 
			,number_of_lives_as_of::timestamp 
			,payment_cycle::int 
			,renewal_percentage_change::double precision 
			,last_modified_on
			,created_on
	from benefitpoint.stg_rate 
	on conflict (rate_id, product_id) do update 
	set 	 response_id 					= excluded.response_id 
			,description 					= excluded.description 
			,rate_type_id 					= excluded.rate_type_id 
			,rate_type_tier_id 				= excluded.rate_type_tier_id 
			,effective_as_of 				= excluded.effective_as_of 
			,expiration_on 					= excluded.expiration_on 
			,include_ee 					= excluded.include_ee 
			,age_banded 					= excluded.age_banded 
			,age_banded_start_on 			= excluded.age_banded_start_on 
			,age_banded_end_on 				= excluded.age_banded_end_on 
			,age_banded_interval 			= excluded.age_banded_interval 
			,age_banded_gender_specific 	= excluded.age_banded_gender_specific 
			,rating_method 					= excluded.rating_method 
			,estimated_monthly_premium		= excluded.estimated_monthly_premium
			,estimated_monthly_revenue		= excluded.estimated_monthly_revenue
			,additional_info				= excluded.additional_info
			,rate_guarantee					= excluded.rate_guarantee
			,rate_guarantee_uom				= excluded.rate_guarantee_uom
			,number_of_lives_as_of			= excluded.number_of_lives_as_of
			,payment_cycle					= excluded.payment_cycle
			,renewal_percentage_change		= excluded.renewal_percentage_change
			,last_modified_on				= excluded.last_modified_on
			,created_on						= excluded.created_on
	where 	(rate.response_id,rate.description,rate.rate_type_id,rate.rate_type_tier_id,rate.effective_as_of,rate.expiration_on,rate.include_ee,rate.age_banded,rate.age_banded_start_on,rate.age_banded_end_on,rate.age_banded_interval,rate.age_banded_gender_specific,rate.rating_method,rate.estimated_monthly_premium,rate.estimated_monthly_revenue,rate.additional_info,rate.rate_guarantee,rate.rate_guarantee_uom,rate.number_of_lives_as_of,rate.payment_cycle,rate.renewal_percentage_change,rate.last_modified_on,rate.created_on) 
		is distinct from (excluded.response_id,excluded.description,excluded.rate_type_id,excluded.rate_type_tier_id,excluded.effective_as_of,excluded.expiration_on,excluded.include_ee,excluded.age_banded,excluded.age_banded_start_on,excluded.age_banded_end_on,excluded.age_banded_interval,excluded.age_banded_gender_specific,excluded.rating_method,excluded.estimated_monthly_premium,excluded.estimated_monthly_revenue,excluded.additional_info,excluded.rate_guarantee,excluded.rate_guarantee_uom,excluded.number_of_lives_as_of,excluded.payment_cycle,excluded.renewal_percentage_change,excluded.last_modified_on,excluded.created_on);

	get diagnostics rc = row_count;

	return rc;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_upsert() to rl_benefitpoint_x;
go 
