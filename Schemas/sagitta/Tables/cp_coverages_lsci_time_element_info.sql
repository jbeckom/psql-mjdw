CREATE TABLE sagitta.cp_coverages_lsci_time_element_info (
	 sagitem 												TEXT 		NOT NULL 
	,lis 													int 		NOT NULL 
	,time_element_subject_insurance_cd 						TEXT 		NULL 
	,time_element_subject_insurance_desc 					TEXT 		NULL 
	,time_element_monthy_limit 								TEXT 		NULL 
	,time_element_num_days 									TEXT 		NULL 
	,time_element_floor_area_num_units 						TEXT 		NULL 
	,time_element_manufacturing_area_num_units 				TEXT 		NULL 
	,time_element_mercantile_area_num_units 				TEXT 		NULL 
	,time_element_option_cd 								TEXT 		NULL 
	,time_element_limit_on_loss_cd 							TEXT 		NULL 
	,time_element_payroll_cd 								TEXT 		NULL 
	,time_element_payroll_amt 								TEXT 		NULL 
	,time_element_num_extension_business_income_days 		TEXT 		NULL 
	,time_element_maximum_indemnity_period 					TEXT 		NULL 
	,CONSTRAINT cp_coverages_lsci_time_element_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_coverages_lsci_time_element_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.cp_coverages_lsci_time_element_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_coverages_lsci_time_element_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_coverages_lsci_time_element_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_coverages_lsci_time_element_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_coverages_lsci_time_element_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_coverages_lsci_time_element_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_u();
GO 
