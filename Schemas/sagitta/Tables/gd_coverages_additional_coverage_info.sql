CREATE TABLE sagitta.gd_coverages_additional_coverage_info (
	 sagitem 								int 			NOT NULL 
	,lis 									int 			NOT NULL 
	,addl_coverage_cd                       TEXT          NULL
	,additional_state_coverage_info         TEXT          NULL
	,state_prov_cd                          TEXT          NULL
	,buyback_yes_no_cd                      TEXT          NULL
	,addl_cov_form_num                      TEXT          NULL
	,addl_edition_dt                        TEXT          NULL
	,addl_coverage_1_limit                  TEXT          NULL
	,addl_coverage_2_limit                  TEXT          NULL
	,addl_deductible_1_amt                  TEXT          NULL
	,addl_deductible_2_amt                  TEXT          NULL
	,addl_deductible_factor                 TEXT          NULL
	,addl_cov_deductible_type               TEXT          NULL
	,addl_cov_deductible_credit_pct         TEXT          NULL
	,additional_coverage_info               TEXT          NULL
	,addl_cov_1_vehicle_num                 TEXT          NULL
	,addl_cov_2_vehicle_num                 TEXT          NULL
	,addl_cov_3_vehicle_num                 TEXT          NULL
	,addl_cov_4_vehicle_num                 TEXT          NULL
	,addl_cov_5_vehicle_num                 TEXT          NULL
	,addl_cov_6_vehicle_num                 TEXT          NULL
	,addl_cov_7_vehicle_num                 TEXT          NULL
	,miscellaneous_options_info             TEXT          NULL
	,miscellaneous_options_1_cd             TEXT          NULL
	,miscellaneous_options_2_cd             TEXT          NULL
	,addlcov_option_info                    TEXT          NULL
	,addl_cov_option_1_cd                   TEXT          NULL
	,addl_cov_option_2_cd                   TEXT          NULL
	,addl_cov_option_3_cd                   TEXT          NULL
	,addl_cov_option_4_cd                   TEXT          NULL
	,addl_cov_benefits_info                 TEXT          NULL
	,addl_cov_benefits_1_cd                 TEXT          NULL
	,addl_cov_benefits_2_cd                 TEXT          NULL
	,addl_cov_benefits_3_cd                 TEXT          NULL
	,addl_cov_rate_factor                   TEXT          NULL
	,addl_cov_premium_amt                   TEXT          NULL
	,addl_coverage_cd_desc                  TEXT          NULL
	,CONSTRAINT gd_coverages_additional_coverage_info_pkey 			PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.gd_coverages_additional_coverage_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.gd_coverages_additional_coverage_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.gd_coverages_additional_coverage_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.gd_coverages_additional_coverage_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.gd_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_additional_coverage_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.gd_coverages_additional_coverage_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_additional_coverage_info_i();
GO

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.gd_coverages_additional_coverage_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_gd_coverages_additional_coverage_info_u();
GO 