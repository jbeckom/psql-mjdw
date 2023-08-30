CREATE TABLE sagitta.cp_coverages_lsci_extension_excl_optional_info (
	 sagitem 							text 		NOT NULL 
	,lis 								int 		NOT NULL 
	,optional_coverages_cd 				TEXT 		NULL 
	,optional_limit 					TEXT 		NULL 
	,optional_deductible_ind 			TEXT 		NULL 
	,optional_deductible 				TEXT 		NULL 
	,optional_deductible_type_cd 		TEXT 		NULL 
	,optional_deductible_basis_cd 		TEXT 		NULL 
	,reporting_period_cd 				TEXT 		NULL 
	,optional_coverages_desc 			TEXT 		NULL 
	,optional_peak_season_start_dt 		TEXT 		NULL 
	,optional_peak_season_end_dt 		TEXT 		NULL 
	,option_form_number 				TEXT 		NULL 
	,option_edition_dt 					TEXT 		NULL 
	,optional_amt 						TEXT 		NULL 
	,CONSTRAINT cp_coverages_lsci_extension_excl_optional_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_coverages_lsci_extension_excl_optional_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.cp_coverages_lsci_extension_excl_optional_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_coverages_lsci_extension_excl_optional_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_coverages_lsci_extension_excl_optional_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_coverages_lsci_extension_excl_optional_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_coverages_lsci_extension_excl_optional_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_coverages_lsci_extension_excl_optional_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_coverages_lsci_extension_excl_optional_info_u();
GO 