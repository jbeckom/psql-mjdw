CREATE TABLE sagitta.audit_ba_coverages_doc_info (
	 sagitem 									TEXT 		NOT NULL 
	,lis 										int 		NOT NULL 
	,old_doc_class_cd 							TEXT 		NULL 
	,new_doc_class_cd 							TEXT 		NULL 
	,old_doc_location_agency_id 				TEXT 		NULL 
	,new_doc_location_agency_id 				TEXT 		NULL 
	,old_doc_state_prov_cd 						TEXT 		NULL 
	,new_doc_state_prov_cd 						TEXT 		NULL 
	,old_doc_territory_cd 						TEXT 		NULL 
	,new_doc_territory_cd 						TEXT 		NULL 
	,old_doc_num_employees 						TEXT 		NULL 
	,new_doc_num_employees 						TEXT 		NULL 
	,old_doc_num_individuals_covered 			TEXT 		NULL 
	,new_doc_num_individuals_covered 			TEXT 		NULL 
	,old_doc_fin_resp_doc_cert_yes_no_cd 		TEXT 		NULL 
	,new_doc_fin_resp_doc_cert_yes_no_cd 		TEXT 		NULL 
	,audit_action 								char(1) 	NOT NULL 
	,audit_user 								TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 							timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 									bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_ba_coverages_doc_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_ba_coverages_doc_info TO rl_sagitta_a;
GO 
