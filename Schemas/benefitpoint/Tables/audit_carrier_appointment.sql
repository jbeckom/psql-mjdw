CREATE TABLE IF NOT EXISTS benefitpoint.audit_carrier_appointment (
	 carrier_source 			text 			not null 
	,source_key 				int 			not null 
	,carrier_appointment_id 	int 			NOT NULL 
	,old_carrier_id 			int 			NULL 
	,new_carrier_id 			int 			null
	,old_appointment_on 		timestamp 		NULL 
	,new_appointment_on 		timestamp 		NULL 
	,old_appointment_number 	TEXT 			NULL 
	,new_appointment_number 	TEXT 			NULL 
	,old_states 				text 			null 
	,new_states 				text 			null 
	,old_active 				bool 			NULL 
	,new_active 				bool 			NULL 
	,audit_action 				char(1) 		NOT NULL 
	,audit_user 				TEXT 			NOT NULL 	DEFAULT current_user
	,audit_timestamp 			timestamp 		NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 			NOT NULL 	GENERATED ALWAYS AS IDENTITY 	PRIMARY KEY 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_carrier_appointment OWNER TO mj_admin;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_carrier_appointment TO rl_benefitpoint_a;
GO 
