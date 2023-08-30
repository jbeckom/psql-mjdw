create or replace function benefitpoint.sp_policy_integration_info_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.policy_integration_info (
		 product_id 
		,account_id 
		,sagitta_policy_id 
		,ams_policy_id 
		,tam_policy_id 
		,vision_policy_id 
	)
	select 	 product_id 
			,account_id 
			,sagitta_policy_id 
			,ams_policy_id 
			,tam_policy_id 
			,vision_policy_id 
	from 	benefitpoint.stg_policy_integration_info 
	on conflict (product_id, account_id) do update 
	set  sagitta_policy_id 	= excluded.sagitta_policy_id 
		,ams_policy_id 		= excluded.ams_policy_id 
		,tam_policy_id 		= excluded.tam_policy_id 
		,vision_policy_id 	= excluded.vision_policy_id 
	where 	(policy_integration_info.sagitta_policy_id,policy_integration_info.ams_policy_id,policy_integration_info.tam_policy_id,policy_integration_info.vision_policy_id) 
		is distinct from 	(excluded.sagitta_policy_id,excluded.ams_policy_id,excluded.tam_policy_id,excluded.vision_policy_id); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_policy_integration_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_policy_integration_info_upsert() to rl_benefitpoint_x;
go 