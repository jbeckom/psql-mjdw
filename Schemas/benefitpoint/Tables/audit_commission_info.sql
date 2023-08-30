create table benefitpoint.audit_commission_info (
     product_id                             int                 not null 
    ,account_id                             int                 not null 
    ,old_alternative_policy_number          text                null 
    ,new_alternative_policy_number          text                null 
    ,old_new_business_until                 timestamp           null 
    ,new_new_business_until                 timestamp           null 
    ,old_commission_start_on                timestamp           null 
    ,new_commission_start_on                timestamp           null 
    ,old_notes                              text                null 
    ,new_notes                              text                null 
	,audit_action 				            char(1) 	        NOT NULL 
	,audit_user 				            TEXT 		        NOT NULL 	        DEFAULT current_user 
	,audit_timestamp 			            timestamp 	        NOT NULL 	        DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					            bigint 		        NOT NULL 	        GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_commission_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_commission_info to rl_benefitpoint_a;
go 
