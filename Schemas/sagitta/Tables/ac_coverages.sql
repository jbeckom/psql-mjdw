CREATE TABLE sagitta.ac_coverages (
	 sagitem 								int 	NOT NULL 
	,audit_staff_cd 						TEXT 	NULL 
	,audit_entry_dt 						int 	NULL 
	,audit_time 							int 	NULL 
	,audit_cd 								TEXT 	NULL 
	,audit_history_record_number 			TEXT 	NULL 
	,audit_program 							TEXT 	NULL 
	,audit_effective_dt 					TEXT 	NULL 
	,audit_change_agency_id 				TEXT 	NULL 
	,policy_agency_id 						TEXT 	NULL 
	,state_prov_cd 							TEXT 	NULL 
	,named_customer_name 					TEXT 	NULL 
	,reporting 								TEXT 	NULL 
	,non_reporting 							TEXT 	NULL 
	,accts_rec_dep_premium_amt 				TEXT 	NULL 
	,accts_rec_min_premium_amt 				TEXT 	NULL 
	,accts_rec_reporting_period 			TEXT 	NULL 
	,accts_rec_prem_adjustment_period_desc 	TEXT 	NULL 
	,accts_rec_first_rate 					TEXT 	NULL 
	,accts_re_second_rate 					TEXT 	NULL 
	,accts_rec_rate_premium_amt 			TEXT 	NULL 
	,not_at_your_premises 					TEXT 	NULL 
	,all_covered_prop_all_location 			TEXT 	NULL 
	,accts_rec_in_transit_limit 			TEXT 	NULL 
	,accts_rec_collapse 					TEXT 	NULL 
	,accts_rec_removal 						TEXT 	NULL 
	,libraries_endorsment_applies 			TEXT 	NULL 
	,val_papers_lmt_away_from_premises 		TEXT 	NULL 
	,val_papers_blanket 					TEXT 	NULL 
	,val_papers_blanket_amt 				TEXT 	NULL 
	,val_papers_specified 					TEXT 	NULL 
	,val_papers_specified_amt 				TEXT 	NULL 
	,val_papers_collapse 					TEXT 	NULL 
	,val_papers_occurence_ded_amt 			TEXT 	NULL 
	,val_papers_removal 					TEXT 	NULL 
	,val_papers_removal_limit 				TEXT 	NULL 
	,off_dt 								TEXT 	NULL 
	,accts_rec_reporting_period_cd 			TEXT 	NULL 
	,CONSTRAINT ac_coverages_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.ac_coverages OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.ac_coverages TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.ac_coverages TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.ac_coverages TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.ac_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.ac_coverages FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.ac_coverages FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_ac_coverages_u();
GO 