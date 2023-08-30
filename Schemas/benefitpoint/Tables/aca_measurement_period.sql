CREATE TABLE IF NOT EXISTS benefitpoint.aca_measurement_period (
 	 account_id 			int 	NOT NULL 
 	,measurement_period 	benefitpoint.measurement_period 	NOT NULL 
 	,start_date 			TEXT 	NULL 
 	,end_date 				TEXT 	NULL 
 	,CONSTRAINT aca_measurement_period_pkey PRIMARY KEY (account_id, measurement_period)
 	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.aca_measurement_period OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.aca_measurement_period TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.aca_measurement_period TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.aca_measurement_period TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.aca_measurement_period FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_aca_measurement_period_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.aca_measurement_period FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_aca_measurement_period_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.aca_measurement_period FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_aca_measurement_period_u();
GO 