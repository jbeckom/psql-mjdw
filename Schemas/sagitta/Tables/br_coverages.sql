CREATE TABLE sagitta.br_coverages (
	 sagitem 									int 		NOT NULL 
	,audit_staff_cd 							TEXT 		NULL 
	,audit_entry_dt 							int  		NULL 
	,audit_time 								int 		NULL 
	,audit_cd 									TEXT 		NULL 
	,audit_history_record_number 				TEXT 		NULL 
	,audit_program 								TEXT 		NULL 
	,audit_effective_dt 						TEXT 		NULL 
	,audit_change_agency_id 					TEXT 		NULL 
	,policy_agency_id 							TEXT 		NULL 
	,builders_risk_yes_no_cd 					TEXT 		NULL 
	,installation_yes_no_cd 					TEXT 		NULL 
	,open_reporting_ind 						TEXT 		NULL 
	,job_specified_ind 							TEXT 		NULL 
	,completed_value 							TEXT 		NULL 
	,job_specific_location_limit 				TEXT 		NULL 
	,job_specific_temporary_limit 				TEXT 		NULL 
	,job_specific_transit_limit 				TEXT 		NULL 
	,job_specific_max_paid 						TEXT 		NULL 
	,first_any_one_location_limit 				TEXT 		NULL 
	,first_any_one_location_construction 		TEXT 		NULL 
	,second_any_one_location_limit 				TEXT 		NULL 
	,second_any_one_location_construction 		TEXT 		NULL 
	,per_disaster_limit 						TEXT 		NULL 
	,temporary_location_limit 					TEXT 		NULL 
	,transit_limit 								TEXT 		NULL 
	,addl_cov_ind 								TEXT 		NULL 
	,off_dt 									TEXT 		NULL 
	,reporting_annual_premium_amt 				TEXT 		NULL 
	,reporting_adj_period 						TEXT 		NULL 
	,reporting_deposit_amt 						TEXT 		NULL 
	,reporting_period 							TEXT 		NULL 
	,CONSTRAINT br_coverages_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.br_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.br_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.br_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.br_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.br_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.br_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_br_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.br_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_br_coverages_u();
GO 