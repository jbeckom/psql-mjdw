create or replace function benefitpoint.sp_product_upsert() 
returns int 
language plpgsql 
as $$

declare rc int;

begin 
	insert into benefitpoint.product(
		 product_id 
        ,account_id 
        ,product_type_id 
        ,is_additional_product  
        ,product_status 
        ,name 
        ,carrier_id 
        ,broker_of_record_account_id  
        ,broker_of_record_as_of  
        ,policy_number 
        ,policy_origination_reason 
        ,policy_origination_reason_qualifier_id  
        ,parent_product_id  
        ,effective_as_of  
        ,renewal_on  
        ,continuous_policy  
        ,original_effective_as_of  
        ,cancellation_on  
        ,cancellation_reason 
        ,cancellation_additional_information 
        ,reinstatement_on  
        ,reinstatement_reason 
        ,reinstatement_additional_information 
        ,voluntary_product  
        ,union_product  
        ,non_payable  
        ,non_revenue  
        ,premium_payment_frequency 
        ,number_of_eligible_employees  
        ,total_estimated_monthly_revenue  
        ,total_estimated_monthly_premium   
        ,billing_type 
        ,billing_carrier_type 
        ,billing_carrier_id 
        ,office_id 
        ,department_id  
        ,primary_sales_lead_user_id 
        ,primary_servicer_lead_user_id 
        ,last_modified_on  
        ,created_on  
        ,metal_level_type 
        ,aca_safe_harbor_type 
        ,aca_sage_harbor_reporting_year  
        ,custom_cancellation_reason_id  
	)
	select 	 product_id 
	        ,account_id 
	        ,product_type_id 
	        ,is_additional_product::bool   
	        ,product_status 
	        ,name 
	        ,carrier_id 
	        ,broker_of_record_account_id::int 
	        ,broker_of_record_as_of::timestamp 
	        ,policy_number 
	        ,policy_origination_reason 
	        ,policy_origination_reason_qualifier_id::int 
	        ,parent_product_id::int 
	        ,effective_as_of::timestamp 
	        ,renewal_on::timestamp 
	        ,continuous_policy::bool 
	        ,original_effective_as_of::timestamp 
	        ,cancellation_on::timestamp 
	        ,cancellation_reason 
	        ,cancellation_additional_information 
	        ,reinstatement_on::timestamp 
	        ,reinstatement_reason 
	        ,reinstatement_additional_information 
	        ,voluntary_product::bool 
	        ,union_product::bool 
	        ,non_payable::bool 
	        ,non_revenue::bool 
	        ,premium_payment_frequency 
	        ,number_of_eligible_employees::int 
	        ,total_estimated_monthly_revenue::double precision 
	        ,total_estimated_monthly_premium::double precision  
	        ,billing_type 
	        ,billing_carrier_type 
	        ,billing_carrier_id 
	        ,office_id 
	        ,department_id::int 
	        ,primary_sales_lead_user_id::int 
	        ,primary_servicer_lead_user_id::int 
	        ,last_modified_on::timestamp 
	        ,created_on::timestamp 
	        ,metal_level_type 
	        ,aca_safe_harbor_type 
	        ,aca_sage_harbor_reporting_year::int 
	        ,custom_cancellation_reason_id::int 
	from 	benefitpoint.stg_product
	on conflict (product_id,account_id) do update 
	set 	 product_type_id 							= excluded.product_type_id 
			,is_additional_product 						= excluded.is_additional_product 
			,product_status 							= excluded.product_status 
			,name 										= excluded.name 
			,carrier_id 								= excluded.carrier_id 
			,broker_of_record_account_id 				= excluded.broker_of_record_account_id 
			,broker_of_record_as_of 					= excluded.broker_of_record_as_of 
			,policy_number 								= excluded.policy_number 
			,policy_origination_reason 				= excluded.policy_origination_reason 
			,policy_origination_reason_qualifier_id 	= excluded.policy_origination_reason_qualifier_id 
			,parent_product_id 							= excluded.parent_product_id 
			,effective_as_of 							= excluded.effective_as_of 
			,renewal_on 								= excluded.renewal_on 
			,continuous_policy 							= excluded.continuous_policy 
			,original_effective_as_of 					= excluded.original_effective_as_of 
			,cancellation_on 							= excluded.cancellation_on 
			,cancellation_reason 						= excluded.cancellation_reason 
			,cancellation_additional_information 		= excluded.cancellation_additional_information 
			,reinstatement_on 							= excluded.reinstatement_on 
			,reinstatement_reason 						= excluded.reinstatement_reason 
			,reinstatement_additional_information 		= excluded.reinstatement_additional_information 
			,voluntary_product 							= excluded.voluntary_product 
			,union_product 								= excluded.union_product 
			,non_payable 								= excluded.non_payable 
			,non_revenue 								= excluded.non_revenue 
			,premium_payment_frequency 					= excluded.premium_payment_frequency 
			,number_of_eligible_employees 				= excluded.number_of_eligible_employees 
			,total_estimated_monthly_revenue 			= excluded.total_estimated_monthly_revenue 
			,total_estimated_monthly_premium 			= excluded.total_estimated_monthly_premium 
			,billing_type 								= excluded.billing_type 
			,billing_carrier_type 						= excluded.billing_carrier_type 
			,billing_carrier_id 						= excluded.billing_carrier_id 
			,office_id 									= excluded.office_id 
			,department_id 								= excluded.department_id 
			,primary_sales_lead_user_id 				= excluded.primary_sales_lead_user_id 
			,primary_servicer_lead_user_id 				= excluded.primary_servicer_lead_user_id 
			,last_modified_on 							= excluded.last_modified_on 
			,created_on 								= excluded.created_on 
			,metal_level_type 							= excluded.metal_level_type 
			,aca_safe_harbor_type 						= excluded.aca_safe_harbor_type 
			,aca_sage_harbor_reporting_year 			= excluded.aca_sage_harbor_reporting_year 
			,custom_cancellation_reason_id 				= excluded.custom_cancellation_reason_id 
	where 	(product.product_type_id,product.is_additional_product,product.product_status,product.name,product.carrier_id,product.broker_of_record_account_id,product.broker_of_record_as_of,product.policy_number,product.policy_origination_reason,product.policy_origination_reason_qualifier_id,product.parent_product_id,product.effective_as_of,product.renewal_on,product.continuous_policy,product.original_effective_as_of,product.cancellation_on,product.cancellation_reason,product.cancellation_additional_information,product.reinstatement_on,product.reinstatement_reason,product.reinstatement_additional_information,product.voluntary_product,product.union_product,product.non_payable,product.non_revenue,product.premium_payment_frequency,product.number_of_eligible_employees,product.total_estimated_monthly_revenue,product.total_estimated_monthly_premium,product.billing_type,product.billing_carrier_type,product.billing_carrier_id,product.office_id,product.department_id,product.primary_sales_lead_user_id,product.primary_servicer_lead_user_id,product.last_modified_on,product.created_on,product.metal_level_type,product.aca_safe_harbor_type,product.aca_sage_harbor_reporting_year,product.custom_cancellation_reason_id) 
		is distinct from 	(excluded.product_type_id,excluded.is_additional_product,excluded.product_status,excluded.name,excluded.carrier_id,excluded.broker_of_record_account_id,excluded.broker_of_record_as_of,excluded.policy_number,excluded.policy_origination_reason,excluded.policy_origination_reason_qualifier_id,excluded.parent_product_id,excluded.effective_as_of,excluded.renewal_on,excluded.continuous_policy,excluded.original_effective_as_of,excluded.cancellation_on,excluded.cancellation_reason,excluded.cancellation_additional_information,excluded.reinstatement_on,excluded.reinstatement_reason,excluded.reinstatement_additional_information,excluded.voluntary_product,excluded.union_product,excluded.non_payable,excluded.non_revenue,excluded.premium_payment_frequency,excluded.number_of_eligible_employees,excluded.total_estimated_monthly_revenue,excluded.total_estimated_monthly_premium,excluded.billing_type,excluded.billing_carrier_type,excluded.billing_carrier_id,excluded.office_id,excluded.department_id,excluded.primary_sales_lead_user_id,excluded.primary_servicer_lead_user_id,excluded.last_modified_on,excluded.created_on,excluded.metal_level_type,excluded.aca_safe_harbor_type,excluded.aca_sage_harbor_reporting_year,excluded.custom_cancellation_reason_id); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go

/*** PERMISSIONS ***/
alter function benefitpoint.sp_product_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_product_upsert() to rl_benefitpoint_x;
go 