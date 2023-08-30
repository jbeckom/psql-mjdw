CREATE TABLE sagitta.audit_cp_coverages_lsci_extension_excl_optional_info (
	 sagitem 								TEXT 		NOT NULL 
	,lis 									int 		NOT NULL 
	,old_optional_coverages_cd 				TEXT 		NULL 
	,new_optional_coverages_cd 				TEXT 		NULL 
	,old_optional_limit 					TEXT 		NULL 
	,new_optional_limit 					TEXT 		NULL 
	,old_optional_deductible_ind 			TEXT 		NULL 
	,new_optional_deductible_ind 			TEXT 		NULL 
	,old_optional_deductible 				TEXT 		NULL 
	,new_optional_deductible 				TEXT 		NULL 
	,old_optional_deductible_type_cd 		TEXT 		NULL 
	,new_optional_deductible_type_cd 		TEXT 		NULL 
	,old_optional_deductible_basis_cd 		TEXT 		NULL 
	,new_optional_deductible_basis_cd 		TEXT 		NULL 
	,old_reporting_period_cd 				TEXT 		NULL 
	,new_reporting_period_cd 				TEXT 		NULL 
	,old_optional_coverages_desc 			TEXT 		NULL 
	,new_optional_coverages_desc 			TEXT 		NULL 
	,old_optional_peak_season_start_dt 		TEXT 		NULL 
	,new_optional_peak_season_start_dt 		TEXT 		NULL 
	,old_optional_peak_season_end_dt 		TEXT 		NULL 
	,new_optional_peak_season_end_dt 		TEXT 		NULL 
	,old_option_form_number 				TEXT 		NULL 
	,new_option_form_number 				TEXT 		NULL 
	,old_option_edition_dt 					TEXT 		NULL 
	,new_option_edition_dt 					TEXT 		NULL 
	,old_optional_amt 						TEXT 		NULL 
	,new_optional_amt 						TEXT 		NULL 
	,audit_action 							char(1) 		NOT NULL 
	,audit_user 							TEXT 			NOT NULL 		DEFAULT current_user 
	,audit_timestamp 						timestamp 		NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 								bigint 			NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_coverages_lsci_extension_excl_optional_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_coverages_lsci_extension_excl_optional_info TO rl_sagitta_a;
GO 