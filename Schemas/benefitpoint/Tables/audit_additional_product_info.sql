create table benefitpoint.audit_additional_product_info(
     product_id                             int                         not null 
    ,account_id                             int                         not null 
    ,old_estimated_commission               double precision            null 
    ,new_estimated_commission               double precision            null 
    ,old_commission_period_type             text                        null 
    ,new_commission_period_type             text                        null 
    ,old_notes                              text                        null 
    ,new_notes                              text                        null 
    ,old_requires_5500                      bool                        null 
    ,new_requires_5500                      bool                        null 
    ,old_erisa_plan                         text                        null 
    ,new_erisa_plan                         text                        null 
    ,old_erisa_plan_year_end_month          int                         null 
    ,new_erisa_plan_year_end_month          int                         null 
    ,old_erisa_plan_year_end_day            int                         null 
    ,new_erisa_plan_year_end_day            int                         null 
    ,old_alternative_plan_id                int                         null 
    ,new_alternative_plan_id                int                         null 
    ,audit_action 		                    char(1) 	                NOT NULL 
	,audit_user 		                    TEXT 		                NOT NULL 	DEFAULT current_user 
	,audit_timestamp 	                    timestamp 	                NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 			                    bigint 		                NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_additional_product_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_additional_product_info to rl_benefitpoint_a;
go 