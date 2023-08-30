create or replace function benefitpoint.tr_audit_product_i() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into benefitpoint.audit_product(
         product_id 
        ,account_id 
        ,new_product_type_id 
        ,new_is_additional_product 
        ,new_product_status 
        ,new_name 
        ,new_carrier_id 
        ,new_broker_of_record_account_id 
        ,new_broker_of_record_as_of 
        ,new_policy_number 
        ,new_policy_origination_reason 
        ,new_policy_origination_reason_qualifier_id 
        ,new_parent_product_id 
        ,new_effective_as_of 
        ,new_renewal_on 
        ,new_continuous_policy 
        ,new_original_effective_as_of 
        ,new_cancellation_on 
        ,new_cancellation_reason 
        ,new_cancellation_additional_information 
        ,new_reinstatement_on 
        ,new_reinstatement_reason 
        ,new_reinstatement_additional_information 
        ,new_voluntary_product 
        ,new_union_product 
        ,new_non_payable 
        ,new_non_revenue 
        ,new_premium_payment_frequency 
        ,new_number_of_eligible_employees 
        ,new_total_estimated_monthly_revenue 
        ,new_total_estimated_monthly_premium 
        ,new_billing_type 
        ,new_billing_carrier_type 
        ,new_billing_carrier_id 
        ,new_office_id 
        ,new_department_id 
        ,new_primary_sales_lead_user_id 
        ,new_primary_servicer_lead_user_id 
        ,new_last_modified_on 
        ,new_created_on 
        ,new_metal_level_type 
        ,new_aca_safe_harbor_type 
        ,new_aca_sage_harbor_reporting_year 
        ,new_custom_cancellation_reason_id 
        ,audit_action 
    )
    select   new.product_id 
            ,new.account_id 
            ,new.product_type_id 
            ,new.is_additional_product 
            ,new.product_status 
            ,new.name 
            ,new.carrier_id 
            ,new.broker_of_record_account_id 
            ,new.broker_of_record_as_of 
            ,new.policy_number 
            ,new.policy_origination_reason 
            ,new.policy_origination_reason_qualifier_id 
            ,new.parent_product_id 
            ,new.effective_as_of 
            ,new.renewal_on 
            ,new.continuous_policy 
            ,new.original_effective_as_of 
            ,new.cancellation_on 
            ,new.cancellation_reason 
            ,new.cancellation_additional_information 
            ,new.reinstatement_on 
            ,new.reinstatement_reason 
            ,new.reinstatement_additional_information 
            ,new.voluntary_product 
            ,new.union_product 
            ,new.non_payable 
            ,new.non_revenue 
            ,new.premium_payment_frequency 
            ,new.number_of_eligible_employees 
            ,new.total_estimated_monthly_revenue 
            ,new.total_estimated_monthly_premium 
            ,new.billing_type 
            ,new.billing_carrier_type 
            ,new.billing_carrier_id 
            ,new.office_id 
            ,new.department_id 
            ,new.primary_sales_lead_user_id 
            ,new.primary_servicer_lead_user_id 
            ,new.last_modified_on 
            ,new.created_on 
            ,new.metal_level_type 
            ,new.aca_safe_harbor_type 
            ,new.aca_sage_harbor_reporting_year 
            ,new.custom_cancellation_reason_id 
            ,'I'; 
    return new;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_i() to rl_benefitpoint_x;
go 