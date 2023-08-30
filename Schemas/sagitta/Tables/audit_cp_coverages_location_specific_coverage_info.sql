CREATE TABLE sagitta.audit_cp_coverages_location_specific_coverage_info (
	 sagitem 														TEXT 		NOT NULL 
	,lis 															int 		NOT NULL 
	,old_building_number 											TEXT 		NULL 
	,new_building_number 											TEXT 		NULL 
	,old_subject_insurance_cd 										TEXT 		NULL 
	,new_subject_insurance_cd 										TEXT 		NULL 
	,old_subject_insurance_desc 									TEXT 		NULL 
	,new_subject_insurance_desc 									TEXT 		NULL 
	,old_insurance_amt 												TEXT 		NULL 
	,new_insurance_amt 												TEXT 		NULL 
	,old_blanket_number 											TEXT 		NULL 
	,new_blanket_number 											TEXT 		NULL 
	,old_loss_cause_cd 												TEXT 		NULL 
	,new_loss_cause_cd 												TEXT 		NULL 
	,old_coinsurance_pct 											TEXT 		NULL 
	,new_coinsurance_pct 											TEXT 		NULL 
	,old_inflation_guard_pct 										TEXT 		NULL 
	,new_inflation_guard_pct 										TEXT 		NULL 
	,old_valuation_type_cd 											TEXT 		NULL 
	,new_valuation_type_cd 											TEXT 		NULL 
	,old_agreed_value_id 											TEXT 		NULL 
	,new_agreed_value_id 											TEXT 		NULL 
	,old_deductible_symbol 											TEXT 		NULL 
	,new_deductible_symbol 											TEXT 		NULL 
	,old_deductible 												TEXT 		NULL 
	,new_deductible 												TEXT 		NULL 
	,old_deductible_type_cd 										TEXT 		NULL 
	,new_deductible_type_cd 										TEXT 		NULL 
	,old_deductible_type_desc 										TEXT 		NULL 
	,new_deductible_type_desc 										TEXT 		NULL 
	,old_deductible_basic_cd 										TEXT 		NULL 
	,new_deductible_basic_cd 										TEXT 		NULL 
	,old_premium_amt 												TEXT 		NULL 
	,new_premium_amt 												TEXT 		NULL 
	,old_building_desc 												TEXT 		NULL 
	,new_building_desc 												TEXT 		NULL 
	,old_start_dt 													TEXT 		NULL 
	,new_start_dt 													TEXT 		NULL 
	,old_end_dt 													TEXT 		NULL 
	,new_end_dt 													TEXT 		NULL 
	,old_second_value_format_cd 									TEXT 		NULL 
	,new_second_value_format_cd 									TEXT 		NULL 
	,old_second_value_amt 											TEXT 		NULL 
	,new_second_value_amt 											TEXT 		NULL 
	,old_off_premises_power_dep_property_commercial_name 			TEXT 		NULL 
	,new_off_premises_power_dep_property_commercial_name 			TEXT 		NULL 
	,old_off_premises_power_dep_property_addr 						TEXT 		NULL 
	,new_off_premises_power_dep_property_addr 						TEXT 		NULL 
	,old_off_premises_power_dep_property_addr_2 					TEXT 		NULL 
	,new_off_premises_power_dep_property_addr_2 					TEXT 		NULL 
	,old_off_premises_power_dep_property_city 						TEXT 		NULL 
	,new_off_premises_power_dep_property_city 						TEXT 		NULL 
	,old_off_premises_power_dep_property_postal_code 				TEXT 		NULL 
	,new_off_premises_power_dep_property_postal_code 				TEXT 		NULL 
	,old_off_premises_power_dep_property_postal_extension_code 		TEXT 		NULL 
	,new_off_premises_power_dep_property_postal_extension_code 		TEXT 		NULL 
	,old_off_premises_power_dep_property_county 					TEXT 		NULL 
	,new_off_premises_power_dep_property_county 					TEXT 		NULL 
	,old_off_premises_power_dep_property_state_prov_cd 				TEXT 		NULL 
	,new_off_premises_power_dep_property_state_prov_cd 				TEXT 		NULL 
	,old_off_premises_power_dep_property_country 					TEXT 		NULL 
	,new_off_premises_power_dep_property_country 					TEXT 		NULL 
	,audit_action 													char(1) 	NOT NULL 
	,audit_user 													TEXT 		NOT NULL 		DEFAULT current_user 
	,audit_timestamp 												timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 														bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_coverages_location_specific_coverage_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_coverages_location_specific_coverage_info TO rl_sagitta_a;
GO 
