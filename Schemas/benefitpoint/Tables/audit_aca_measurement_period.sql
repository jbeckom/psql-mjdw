CREATE TABLE IF NOT EXISTS benefitpoint.audit_aca_measurement_period (
	 account_id 			int 	NOT NULL 
	,measurement_period 	benefitpoint.measurement_period 	NOT NULL 
	,old_start_date 		TEXT 	NULL 
	,new_start_date 		TEXT 	NULL 
	,old_end_date 			TEXT 	NULL 
	,new_end_date 			TEXT 	NULL 
	,audit_action 			char(1) 	NOT NULL 
	,audit_user 			TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 		timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 				bigint 		NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_aca_measurement_period OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_aca_measurement_period TO rl_benefitpoint_a;
GO 
