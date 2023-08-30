CREATE TABLE sagitta.cp_coverages (
	 sagitem 										TEXT 		NOT NULL 
	,audit_staff_cd 								TEXT 		NULL 
	,audit_entry_dt 								int 		NULL 
	,audit_time 									int 		NULL 
	,audit_cd 										TEXT 		NULL 
	,audit_history_record_number 					TEXT 		NULL 
	,audit_program 									TEXT 		NULL 
	,audit_effective_dt 							TEXT 		NULL 
	,audit_change_agency_id 						TEXT 		NULL 
	,policy_agency_id 								TEXT 		NULL 
	,location_number 								TEXT 		NULL 
	,location_desc 									TEXT 		NULL 
	,off_dt 										TEXT 		NULL 
	,location_lower_level_coverage_slice 			TEXT 		NULL 
	,lis_count_location_specific_coverage_info 		TEXT 		NULL 
	,lis_count_extension_excl_optional_info 		TEXT 		NULL 
	,lis_count_time_element_info 					TEXT 		NULL 
	,CONSTRAINT cp_coverages_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.cp_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_u();
GO 