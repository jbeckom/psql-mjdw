create or replace function benefitpoint.sp_retirement_plan_info_upsert ()
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.retirement_plan_info (
		 product_id 
		,account_id 
		,record_keeper_plan_number 
		,plan_adoption_on 
		,fiscal_year_from 
		,fiscal_year_to 
		,audit_required 
		,auditor 
		,trustee 
		,custodian 
	)
	select 	 product_id 
			,account_id 
			,record_keeper_plan_number 
			,plan_adoption_on::timestamp 
			,fiscal_year_from 
			,fiscal_year_to 
			,audit_required::bool 
			,auditor 
			,trustee 
			,custodian 
	from 	benefitpoint.stg_retirement_plan_info 
	on conflict (product_id, account_id) do update 
	set 	 record_keeper_plan_number 	= excluded.record_keeper_plan_number 
			,plan_adoption_on 			= excluded.plan_adoption_on 
			,fiscal_year_from 			= excluded.fiscal_year_from 
			,fiscal_year_to 			= excluded.fiscal_year_to 
			,audit_required 			= excluded.audit_required 
			,auditor 					= excluded.auditor 
			,trustee 					= excluded.trustee 
			,custodian 					= excluded.custodian 
	where 	(retirement_plan_info.record_keeper_plan_number,retirement_plan_info.plan_adoption_on,retirement_plan_info.fiscal_year_from,retirement_plan_info.fiscal_year_to,retirement_plan_info.audit_required,retirement_plan_info.auditor,retirement_plan_info.trustee,retirement_plan_info.custodian) 
		is distinct from 	(excluded.record_keeper_plan_number,excluded.plan_adoption_on,excluded.fiscal_year_from,excluded.fiscal_year_to,excluded.audit_required,excluded.auditor,excluded.trustee,excluded.custodian); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_retirement_plan_info_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_retirement_plan_info_upsert() to rl_benefitpoint_x;
go 
