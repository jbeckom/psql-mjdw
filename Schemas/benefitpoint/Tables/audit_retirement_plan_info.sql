create table benefitpoint.audit_retirement_plan_info (
     product_id                             int                 not null 
    ,account_id                             int                 not null 
    ,old_record_keeper_plan_number          text                null 
    ,new_record_keeper_plan_number          text                null 
    ,old_plan_adoption_on                   timestamp           null 
    ,new_plan_adoption_on                   timestamp           null 
    ,old_fiscal_year_from                   text                null 
    ,new_fiscal_year_from                   text                null 
    ,old_fiscal_year_to                     text                null 
    ,new_fiscal_year_to                     text                null 
    ,old_audit_required                     bool                null 
    ,new_audit_required                     bool                null 
    ,old_auditor                            text                null 
    ,new_auditor                            text                null 
    ,old_trustee                            text                null 
    ,new_trustee                            text                null 
    ,old_custodian                          text                null 
    ,new_custodian                          text                null 
    ,audit_action 			                char(1) 		    NOT NULL 
    ,audit_user 			                TEXT 			    NOT NULL 	        DEFAULT current_user 
    ,audit_timestamp 		                timestamp 		    NOT NULL 	        DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				                bigint 			    NOT NULL 	        GENERATED ALWAYS AS IDENTITY            primary key 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_retirement_plan_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_retirement_plan_info to rl_benefitpoint_a;
go 
