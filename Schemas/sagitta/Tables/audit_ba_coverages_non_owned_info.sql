CREATE TABLE sagitta.audit_ba_coverages_non_owned_info (
	 sagitem 													TEXT 		NOT NULL 
	,lis 														int 		NOT NULL 
	,old_non_owned_class_cd 									TEXT 		NULL 
	,new_non_owned_class_cd 									TEXT 		NULL 
	,old_non_owned_location_agency_id 							TEXT 		NULL 
	,new_non_owned_location_agency_id 							TEXT 		NULL 
	,old_non_owned_state_prov_cd 								TEXT 		NULL 
	,new_non_owned_state_prov_cd 								TEXT 		NULL 
	,old_non_owned_group_type_cd 								TEXT 		NULL 
	,new_non_owned_group_type_cd 								TEXT 		NULL 
	,old_non_owned_num 											TEXT 		NULL 
	,new_non_owned_num 											TEXT 		NULL 
	,old_non_owned_pct 											TEXT 		NULL 
	,new_non_owned_pct 											TEXT 		NULL 
	,old_non_owned_social_service_agency_yes_no_cd 				TEXT 		NULL 
	,new_non_owned_social_service_agency_yes_no_cd 				TEXT 		NULL 
	,old_non_owned_individual_liabilityfor_employees_yes_no_cd 	TEXT 		NULL 
	,new_non_owned_individual_liabilityfor_employees_yes_no_cd 	TEXT 		NULL 
	,audit_action 												char(1) 	NOT NULL 
	,audit_user 												TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 											timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 													bigint 		NOT NULL 	GENERATED BY DEFAULT AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_ba_coverages_non_owned_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_ba_coverages_non_owned_info TO rl_sagitta_a;
GO 
