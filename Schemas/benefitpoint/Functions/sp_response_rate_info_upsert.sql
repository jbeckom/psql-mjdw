create or replace function benefitpoint.sp_response_rate_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.response_rate_info (
		 rate_id 
        ,rate_version 
        ,rate_version_reasons 
        ,parent_rate_id 
        ,selected 
        ,created_by_broker 
        ,quote_valid_through 
	)
	select 	 rate_id 
			,rate_version::int 
			,rate_version_reasons 
			,parent_rate_id::int 
			,selected::bool 
			,created_by_broker::bool 
			,quote_valid_through::timestamp 
	from 	benefitpoint.stg_response_rate_info 
	on conflict (rate_id, rate_version) do update 
	set 	 rate_version_reasons 	= excluded.rate_version_reasons 
			,parent_rate_id 		= excluded.parent_rate_id 
			,selected 				= excluded.selected 
			,created_by_broker 		= excluded.created_by_broker 
			,quote_valid_through 	= excluded.quote_valid_through 
	where 	(response_rate_info.rate_version_reasons,response_rate_info.parent_rate_id,response_rate_info.selected,response_rate_info.created_by_broker,response_rate_info.quote_valid_through) 
		is distinct from 	(excluded.rate_version_reasons,excluded.parent_rate_id,excluded.selected,excluded.created_by_broker,excluded.quote_valid_through); 

	get diagnostics rc = row_count; 

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_response_rate_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_response_rate_info_upsert() to rl_benefitpoint_x;
go 