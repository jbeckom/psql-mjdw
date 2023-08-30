CREATE TABLE sagitta.insurors (
	 sagitem 									int 		NOT NULL 
	,audit_staff_cd 							TEXT 		NULL 
	,audit_entry_dt 							int 		NULL 
	,audit_time 								int 		NULL 
	,audit_cd 									TEXT 		NULL 
	,audit_history_record_number 				TEXT 		NULL 
	,audit_program 								TEXT 		NULL 
	,insurer_cd 								TEXT 		NULL 
	,insurer_name 								TEXT 		NULL 
	,payee_cd 									TEXT 		NULL 
	,addr_1 									TEXT 		NULL 
	,addr_2 									TEXT 		NULL 
	,postal_code 								TEXT 		NULL 
	,postal_extension_code 						TEXT 		NULL 
	,city 										TEXT 		NULL 
	,state_prov_cd 								TEXT 		NULL 
	,telephone_1 								TEXT 		NULL 
	,telephone_2 								TEXT 		NULL 
	,"group" 									TEXT 		NULL 
	,agency_code 								TEXT 		NULL 
	,phone_extension_1_number 					TEXT 		NULL 
	,company_code 								TEXT 		NULL 
	,phone_extension_2_number 					TEXT 		NULL 
	,naic_cd 									TEXT 		NULL 
	,fax_number 								TEXT 		NULL 
	,"type" 									TEXT 		NULL 
	,obsolete_41 								TEXT 		NULL 
	,date_off 									TEXT 		NULL 
	,date_off_remark 							TEXT 		NULL 
	,email_addr 								TEXT 		NULL 
	,rounding_difference 						TEXT 		NULL 
	,description 								TEXT 		NULL 
	,"global" 									TEXT 		NULL 
	,am_best_number 							TEXT 		NULL 
	,bests_financial_strength 					TEXT 		NULL 
	,bests_financial_size 						TEXT 		NULL 
	,state_of_domicile 							TEXT 		NULL 
	,amb_company_name 							TEXT 		NULL 
	,amb_parent_number 							TEXT 		NULL 
	,financial_strength_outlook 				TEXT 		NULL 
	,financial_strength_action 					TEXT 		NULL 
	,fein 										TEXT 		NULL 
	,amb_last_update 							TEXT 		NULL 
	,auto_id_claim_reporting_phone_number 		TEXT 		NULL 
	,auto_id_claim_reporting_phone_extension 	TEXT 		NULL 
	,CONSTRAINT insurors_pkey PRIMARY KEY (sagitem)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.insurors OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.insurors TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.insurors TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.insurors TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.insurors FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.insurors FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_insurors_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.insurors FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_insurors_u();
GO 