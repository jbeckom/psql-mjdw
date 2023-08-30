create table benefitpoint.audit_product (
     product_id                                             int                         not null 
    ,account_id                                             int                         not null 
    ,old_product_type_id                                    int                         null 
    ,new_product_type_id                                    int                         null 
    ,old_is_additional_product                              bool                        null 
    ,new_is_additional_product                              bool                        null 
    ,old_product_status                                     text                        null 
    ,new_product_status                                     text                        null 
    ,old_name                                               text                        null 
    ,new_name                                               text                        null 
    ,old_carrier_id                                         int                         null 
    ,new_carrier_id                                         int                         null 
    ,old_broker_of_record_account_id                        int                         null 
    ,new_broker_of_record_account_id                        int                         null 
    ,old_broker_of_record_as_of                             timestamp                   null 
    ,new_broker_of_record_as_of                             timestamp                   null 
    ,old_policy_number                                      text                        null 
    ,new_policy_number                                      text                        null 
    ,old_policy_origination_reason                          text                        null 
    ,new_policy_origination_reason                          text                        null 
    ,old_policy_origination_reason_qualifier_id             text                        null 
    ,new_policy_origination_reason_qualifier_id             text                        null 
    ,old_parent_product_id                                  int                         null 
    ,new_parent_product_id                                  int                         null 
    ,old_effective_as_of                                    timestamp                   null 
    ,new_effective_as_of                                    timestamp                   null 
    ,old_renewal_on                                         timestamp                   null 
    ,new_renewal_on                                         timestamp                   null 
    ,old_continuous_policy                                  bool                        null 
    ,new_continuous_policy                                  bool                        null 
    ,old_original_effective_as_of                           timestamp                   null 
    ,new_original_effective_as_of                           timestamp                   null 
    ,old_cancellation_on                                    timestamp                   null 
    ,new_cancellation_on                                    timestamp                   null 
    ,old_cancellation_reason                                text                        null 
    ,new_cancellation_reason                                text                        null 
    ,old_cancellation_additional_information                text                        null 
    ,new_cancellation_additional_information                text                        null 
    ,old_reinstatement_on                                   timestamp                   null 
    ,new_reinstatement_on                                   timestamp                   null 
    ,old_reinstatement_reason                               text                        null 
    ,new_reinstatement_reason                               text                        null 
    ,old_reinstatement_additional_information               text                        null 
    ,new_reinstatement_additional_information               text                        null 
    ,old_voluntary_product                                  bool                        null 
    ,new_voluntary_product                                  bool                        null 
    ,old_union_product                                      bool                        null 
    ,new_union_product                                      bool                        null 
    ,old_non_payable                                        bool                        null 
    ,new_non_payable                                        bool                        null 
    ,old_non_revenue                                        bool                        null 
    ,new_non_revenue                                        bool                        null 
    ,old_premium_payment_frequency                          text                        null 
    ,new_premium_payment_frequency                          text                        null 
    ,old_number_of_eligible_employees                       int                         null 
    ,new_number_of_eligible_employees                       int                         null 
    ,old_total_estimated_monthly_revenue                    double precision            null 
    ,new_total_estimated_monthly_revenue                    double precision            null 
    ,old_total_estimated_monthly_premium                    double precision            null 
    ,new_total_estimated_monthly_premium                    double precision            null 
    ,old_billing_type                                       text                        null 
    ,new_billing_type                                       text                        null 
    ,old_billing_carrier_type                               text                        null 
    ,new_billing_carrier_type                               text                        null 
    ,old_billing_carrier_id                                 int                         null 
    ,new_billing_carrier_id                                 int                         null 
    ,old_office_id                                          int                         null 
    ,new_office_id                                          int                         null 
    ,old_department_id                                      int                         null 
    ,new_department_id                                      int                         null 
    ,old_primary_sales_lead_user_id                         int                         null 
    ,new_primary_sales_lead_user_id                         int                         null 
    ,old_primary_servicer_lead_user_id                      int                         null 
    ,new_primary_servicer_lead_user_id                      int                         null 
    ,old_last_modified_on                                   timestamp                   null 
    ,new_last_modified_on                                   timestamp                   null 
    ,old_created_on                                         timestamp                   null 
    ,new_created_on                                         timestamp                   null 
    ,old_metal_level_type                                   text                        null 
    ,new_metal_level_type                                   text                        null 
    ,old_aca_safe_harbor_type                               text                        null 
    ,new_aca_safe_harbor_type                               text                        null 
    ,old_aca_sage_harbor_reporting_year                     int                         null 
    ,new_aca_sage_harbor_reporting_year                     int                         null 
    ,old_custom_cancellation_reason_id                      int                         null 
    ,new_custom_cancellation_reason_id                      int                         null 
    ,audit_action 			                                char(1) 		            NOT NULL 
    ,audit_user 			                                TEXT 			            NOT NULL 	DEFAULT current_user 
    ,audit_timestamp 		                                timestamp 		            NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				                                bigint 			            NOT NULL 	GENERATED ALWAYS AS IDENTITY 
	,CONSTRAINT audit_product_pkey PRIMARY KEY (audit_id)
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_product owner to mj_admin;
go 

grant insert on benefitpoint.audit_product to rl_benefitpoint_a;
go 