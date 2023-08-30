create table benefitpoint.audit_product_msa_info(
     product_id                 int             not null 
    ,account_id                 int             not null 
    ,old_nation_wide            bool            null 
    ,new_nation_wide            bool            null 
    ,old_msa_ids                text            null 
    ,new_msa_ids                text            null 
    ,audit_action 			    char(1) 		NOT NULL 
    ,audit_user 			    TEXT 			NOT NULL 	DEFAULT current_user 
    ,audit_timestamp 		    timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				    bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 
);
go 

/*** PERMISSIONS ***/
alter table benefitpoint.audit_product_msa_info owner to mj_admin;
go 

grant insert on benefitpoint.audit_product_msa_info to rl_benefitpoint_a;
go 