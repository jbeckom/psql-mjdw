CREATE TABLE sagitta.cp_blankets_detailed_rating_information_info (
	 sagitem 				int 		NOT NULL 
	,lis 					int 		NOT NULL 
	,detailed_cause 		TEXT 		NULL 
	,coinsurance_pct 		TEXT 		NULL 
	,detailed_rate 			TEXT 		NULL 
	,detailed_ded_symbol 	TEXT 		NULL 
	,detailed_ded_amt 		TEXT 		NULL 
	,detailed_premium 		TEXT 		NULL 
	,CONSTRAINT cp_blankets_detailed_rating_information_info_pkey PRIMARY KEY (sagitem,lis)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.cp_blankets_detailed_rating_information_info OWNER TO mj_admin;
GO 

GRANT SELECT ON sagitta.cp_blankets_detailed_rating_information_info TO rl_sagitta_r;
GO 

GRANT INSERT ON sagitta.cp_blankets_detailed_rating_information_info TO rl_sagitta_a;
GO 

GRANT UPDATE ON sagitta.cp_blankets_detailed_rating_information_info TO rl_sagitta_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON sagitta.cp_blankets_detailed_rating_information_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON sagitta.cp_blankets_detailed_rating_information_info FOR EACH ROW EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON sagitta.cp_blankets_detailed_rating_information_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION sagitta.tr_audit_cp_blankets_detailed_rating_information_info_u();
GO 
