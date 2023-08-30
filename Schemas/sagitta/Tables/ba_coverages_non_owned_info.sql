CREATE TABLE sagitta.ba_coverages_non_owned_info (
	 sagitem 												TEXT 		NOT NULL 
	,lis 													int 		NOT NULL 
	,non_owned_class_cd 									TEXT 		NULL 
	,non_owned_location_agency_id 							TEXT 		NULL 
	,non_owned_state_prov_cd 								TEXT 		NULL 
	,non_owned_group_type_cd 								TEXT 		NULL 
	,non_owned_num 											TEXT 		NULL 
	,non_owned_pct 											TEXT 		NULL 
	,non_owned_social_service_agency_yes_no_cd 				TEXT 		NULL 
	,non_owned_individual_liabilityfor_employees_yes_no_cd 	TEXT 		NULL 
	,CONSTRAINT ba_coverages_non_owned_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ba_coverages_non_owned_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ba_coverages_non_owned_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ba_coverages_non_owned_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ba_coverages_non_owned_info TO rl_sagitta_w;
GO 
