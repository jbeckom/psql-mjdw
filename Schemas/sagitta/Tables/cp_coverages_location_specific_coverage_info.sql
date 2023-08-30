CREATE TABLE sagitta.cp_coverages_location_specific_coverage_info (
	 sagitem 													TEXT 		NOT NULL 
	,lis 														int 		NOT NULL 
	,building_number 											TEXT 		NULL 
	,subject_insurance_cd 										TEXT 		NULL 
	,subject_insurance_desc 									TEXT 		NULL 
	,insurance_amt 												TEXT 		NULL 
	,blanket_number 											TEXT 		NULL 
	,loss_cause_cd 												TEXT 		NULL 
	,coinsurance_pct 											TEXT 		NULL 
	,inflation_guard_pct 										TEXT 		NULL 
	,valuation_type_cd 											TEXT 		NULL 
	,agreed_value_id 											TEXT 		NULL 
	,deductible_symbol 											TEXT 		NULL 
	,deductible 												TEXT 		NULL 
	,deductible_type_cd 										TEXT 		NULL 
	,deductible_type_desc 										TEXT 		NULL 
	,deductible_basic_cd 										TEXT 		NULL 
	,premium_amt 												TEXT 		NULL 
	,building_desc 												TEXT 		NULL 
	,start_dt 													TEXT 		NULL 
	,end_dt 													TEXT 		NULL 
	,second_value_format_cd 									TEXT 		NULL 
	,second_value_amt 											TEXT 		NULL 
	,off_premises_power_dep_property_commercial_name 			TEXT 		NULL 
	,off_premises_power_dep_property_addr 						TEXT 		NULL 
	,off_premises_power_dep_property_addr_2 					TEXT 		NULL 
	,off_premises_power_dep_property_city 						TEXT 		NULL 
	,off_premises_power_dep_property_postal_code 				TEXT 		NULL 
	,off_premises_power_dep_property_postal_extension_code 		TEXT 		NULL 
	,off_premises_power_dep_property_county 					TEXT 		NULL 
	,off_premises_power_dep_property_state_prov_cd 				TEXT 		NULL 
	,off_premises_power_dep_property_country 					TEXT 		NULL 
	,CONSTRAINT cp_coverages_location_specific_coverage_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_coverages_location_specific_coverage_info OWNER TO mj_admin;
GO

GRANT SELECT ON sagitta.cp_coverages_location_specific_coverage_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_coverages_location_specific_coverage_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_coverages_location_specific_coverage_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_coverages_location_specific_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_coverages_location_specific_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_coverages_location_specific_coverage_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_location_specific_coverage_info_u();
GO 
