create table benefitpoint.audit_policy_integration_info (
     product_id                     int             not null 
    ,account_id                     int             not null 
    ,old_sagitta_policy_id          text            null 
    ,new_sagitta_policy_id          text            null 
    ,old_ams_policy_id              text            null 
    ,new_ams_policy_id              text            null 
    ,old_tam_policy_id              text            null 
    ,new_tam_policy_id              text            null 
    ,old_vision_policy_id           text            null 
    ,new_vision_policy_id           text            null 
    ,audit_action 			        char(1) 		NOT NULL 
    ,audit_user 			        TEXT 			NOT NULL 	DEFAULT current_user 
    ,audit_timestamp 		        timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				        bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY            primary key 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_policy_integration_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_policy_integration_info to rl_benefitpoint_a;
go 
