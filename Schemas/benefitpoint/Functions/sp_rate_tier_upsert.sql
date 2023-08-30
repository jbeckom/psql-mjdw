create or replace function benefitpoint.sp_rate_tier_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.rate_tier (
		 rate_field_id 
        ,rate_tier_id 
        ,description 
        ,allow_include_ee 
	)
	select 	 rate_field_id 
			,rate_tier_id 
			,description 
			,allow_include_ee::bool 
	from 	benefitpoint.stg_rate_tier 
	on conflict (rate_field_id, rate_tier_id) do update 
	set 	 description 		= excluded.description 
        	,allow_include_ee 	= excluded.allow_include_ee 
	where 	(rate_tier.description,rate_tier.allow_include_ee) 
		is distinct from 	(excluded.description,excluded.allow_include_ee); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_rate_tier_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_rate_tier_upsert() to rl_benefitpoint_x;
go 