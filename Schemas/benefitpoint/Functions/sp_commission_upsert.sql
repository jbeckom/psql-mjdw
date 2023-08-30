create or replace function benefitpoint.sp_commission_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.commission (
		 rate_id 
        ,commission_id 
        ,commission_type 
        ,commission_paid_by 
        ,description 
        ,estimated_monthly_revenue 
        ,additional_info 
        ,flat_percentage_of_premium 
        ,premium_override_amount 
        ,estimated_number_of_members 
	)
	select 	 rate_id 
			,commission_id 
			,commission_type 
			,commission_paid_by 
			,description 
			,estimated_monthly_revenue::double precision 
			,additional_info 
			,flat_percentage_of_premium::double precision 
			,premium_override_amount::double precision  
			,estimated_number_of_members::int 
	from 	benefitpoint.stg_commission 
	on conflict (rate_id, commission_id) do update 
	set 	 commission_type 				= excluded.commission_type 
			,commission_paid_by 			= excluded.commission_paid_by 
			,description 					= excluded.description 
			,estimated_monthly_revenue 		= excluded.estimated_monthly_revenue 
			,additional_info 				= excluded.additional_info 
			,flat_percentage_of_premium 	= excluded.flat_percentage_of_premium 
			,premium_override_amount 		= excluded.premium_override_amount 
			,estimated_number_of_members 	= excluded.estimated_number_of_members 
	where 	(commission.commission_type,commission.commission_paid_by,commission.description,commission.estimated_monthly_revenue,commission.additional_info,commission.flat_percentage_of_premium,commission.premium_override_amount,commission.estimated_number_of_members) 
		is distinct from 	(excluded.commission_type,excluded.commission_paid_by,excluded.description,excluded.estimated_monthly_revenue,excluded.additional_info,excluded.flat_percentage_of_premium,excluded.premium_override_amount,excluded.estimated_number_of_members); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_commission_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_commission_upsert() to rl_benefitpoint_x;
go 
