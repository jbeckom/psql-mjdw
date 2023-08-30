CREATE TABLE benefitpoint.carrier_appointment (
	 carrier_source 			text 			not null 
	,source_key 				int 			not null 
	,carrier_appointment_id 	int 			NOT NULL 
	,carrier_id 				int 			NULL 
	,appointment_on 			timestamp 		NULL 
	,appointment_number 		TEXT 			NULL 
	,states 					TEXT 			NULL 
	,active 					bool 			NULL 
	,CONSTRAINT carrier_appointment_pkey PRIMARY KEY (carrier_source, source_key, carrier_appointment_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.carrier_appointment OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.carrier_appointment TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.carrier_appointment FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.carrier_appointment FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.carrier_appointment FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_carrier_appointment_u();
GO 
