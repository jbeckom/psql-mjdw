CREATE TABLE sagitta.audit_cp_blankets_detailed_rating_information_info (
	 sagitem 					int 		NOT NULL 
	,lis 						int 		NOT NULL 
	,old_detailed_cause 		TEXT 		NULL 
    ,new_detailed_cause 		TEXT 		NULL 
	,old_coinsurance_pct 		TEXT 		NULL 
    ,new_coinsurance_pct 		TEXT 		NULL 
	,old_detailed_rate 			TEXT 		NULL 
    ,new_detailed_rate 			TEXT 		NULL 
	,old_detailed_ded_symbol 	TEXT 		NULL 
    ,new_detailed_ded_symbol 	TEXT 		NULL 
	,old_detailed_ded_amt 		TEXT 		NULL 
    ,new_detailed_ded_amt 		TEXT 		NULL 
	,old_detailed_premium 		TEXT 		NULL 
    ,new_detailed_premium 		TEXT 		NULL 
    ,audit_action 				char(1) 	NOT NULL 
    ,audit_user 				TEXT 		NOT NULL 		DEFAULT current_user 
    ,audit_timestamp 			timestamp 	NOT NULL 		DEFAULT timezone('utc'::TEXT, clock_timestamp())
    ,audit_id 					bigint 		NOT NULL 		GENERATED ALWAYS AS IDENTITY 		PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE sagitta.audit_cp_blankets_detailed_rating_information_info OWNER TO mj_admin;
GO 

GRANT INSERT ON sagitta.audit_cp_blankets_detailed_rating_information_info TO rl_sagitta_a;
GO 
