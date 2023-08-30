create or replace function benefitpoint.tr_audit_product_d() 
returns trigger 
language plpgsql 
as $$

begin 
    insert into benefitpoint.audit_product(
         product_id 
        ,account_id 
        ,old_product_type_id 
        ,old_is_additional_product 
        ,old_product_status 
        ,old_name 
        ,old_carrier_id 
        ,old_broker_of_record_account_id 
        ,old_broker_of_record_as_of 
        ,old_policy_number 
        ,old_policy_origination_reason 
        ,old_policy_origination_reason_qualifier_id 
        ,old_parent_product_id 
        ,old_effective_as_of 
        ,old_renewal_on 
        ,old_continuous_policy 
        ,old_original_effective_as_of 
        ,old_cancellation_on 
        ,old_cancellation_reason 
        ,old_cancellation_additional_information 
        ,old_reinstatement_on 
        ,old_reinstatement_reason 
        ,old_reinstatement_additional_information 
        ,old_voluntary_product 
        ,old_union_product 
        ,old_non_payable 
        ,old_non_revenue 
        ,old_premium_payment_frequency 
        ,old_number_of_eligible_employees 
        ,old_total_estimated_monthly_revenue 
        ,old_total_estimated_monthly_premium 
        ,old_billing_type 
        ,old_billing_carrier_type 
        ,old_billing_carrier_id 
        ,old_office_id 
        ,old_department_id 
        ,old_primary_sales_lead_user_id 
        ,old_primary_servicer_lead_user_id 
        ,old_last_modified_on 
        ,old_created_on 
        ,old_metal_level_type 
        ,old_aca_safe_harbor_type 
        ,old_aca_sage_harbor_reporting_year 
        ,old_custom_cancellation_reason_id 
        ,audit_action 
    )
    select   old.product_id 
            ,old.account_id 
            ,old.product_type_id 
            ,old.is_additional_product 
            ,old.product_status 
            ,old.name 
            ,old.carrier_id 
            ,old.broker_of_record_account_id 
            ,old.broker_of_record_as_of 
            ,old.policy_number 
            ,old.policy_origination_reason 
            ,old.policy_origination_reason_qualifier_id 
            ,old.parent_product_id 
            ,old.effective_as_of 
            ,old.renewal_on 
            ,old.continuous_policy 
            ,old.original_effective_as_of 
            ,old.cancellation_on 
            ,old.cancellation_reason 
            ,old.cancellation_additional_information 
            ,old.reinstatement_on 
            ,old.reinstatement_reason 
            ,old.reinstatement_additional_information 
            ,old.voluntary_product 
            ,old.union_product 
            ,old.non_payable 
            ,old.non_revenue 
            ,old.premium_payment_frequency 
            ,old.number_of_eligible_employees 
            ,old.total_estimated_monthly_revenue 
            ,old.total_estimated_monthly_premium 
            ,old.billing_type 
            ,old.billing_carrier_type 
            ,old.billing_carrier_id 
            ,old.office_id 
            ,old.department_id 
            ,old.primary_sales_lead_user_id 
            ,old.primary_servicer_lead_user_id 
            ,old.last_modified_on 
            ,old.created_on 
            ,old.metal_level_type 
            ,old.aca_safe_harbor_type 
            ,old.aca_sage_harbor_reporting_year 
            ,old.custom_cancellation_reason_id 
            ,'D'; 
    return old;
end;
$$;
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_product_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_product_d() to rl_benefitpoint_x;
go 