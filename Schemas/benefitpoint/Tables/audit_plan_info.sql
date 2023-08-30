create table benefitpoint.audit_plan_info (
     product_id                                 int                 not null 
    ,account_id                                 int                 not null 
    ,old_alternative_plan_id                        text                null 
    ,new_alternative_plan_id                        text                null 
    ,old_erisa_plan                                 text                null 
    ,new_erisa_plan                                 text                null 
    ,old_erisa_plan_year_end_month                  int                 null 
    ,new_erisa_plan_year_end_month                  int                 null 
    ,old_erisa_plan_year_end_day                    int                 null 
    ,new_erisa_plan_year_end_day                    int                 null 
    ,old_notes                                      text                null 
    ,new_notes                                      text                null 
    ,old_frozen_enrollment                          bool                null 
    ,new_frozen_enrollment                          bool                null 
    ,old_requires_5500                              bool                null 
    ,new_requires_5500                              bool                null 
    ,old_frozen_enrollment_effective_as_of          timestamp           null 
    ,new_frozen_enrollment_effective_as_of          timestamp           null 
    ,old_market_size                                text                null 
    ,new_market_size                                text                null 
    ,old_maxiumum_group_size                        int                 null 
    ,new_maxiumum_group_size                        int                 null 
    ,old_minimum_group_size                         int                 null 
    ,new_minimum_group_size                         int                 null 
    ,old_exclusions_limitations                     text                null 
    ,new_exclusions_limitations                     text                null 
    ,old_customizations                             text                null 
    ,new_customizations                             text                null 
    ,old_participation_requirements                 text                null 
    ,new_participation_requirements                 text                null 
    ,old_participation_requirements_vol             text                null 
    ,new_participation_requirements_vol             text                null 
    ,old_state_list                                 text                null 
    ,new_state_list                                 text                null 
    ,old_market_group_plan_id                       int                 null 
    ,new_market_group_plan_id                       int                 null 
	,audit_action 				                    char(1) 			NOT NULL 
	,audit_user 				                    TEXT 				NOT NULL 	DEFAULT current_user
	,audit_timestamp 			                    timestamp 			NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					                    bigint 				NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_plan_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_plan_info to rl_benefitpoint_a;
go 