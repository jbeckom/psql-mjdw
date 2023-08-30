CREATE TABLE benefitpoint.employee_type (
	 account_id 		int 										NOT NULL 
	,employee_type_id 	int 										NOT NULL 
	,status 			benefitpoint.employment_status 				NULL 
	,"type" 			benefitpoint.employment_type 				NULL 
	,value 				int 										NULL 
	,unit_of_measure 	benefitpoint.employment_unit_of_measure 	NULL 
	,frequency 			benefitpoint.employment_frequency 			NULL 
	,CONSTRAINT employee_type_pkey PRIMARY KEY (account_id, employee_type_id)
	,CONSTRAINT account_key FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.employee_type OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.employee_type TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.employee_type TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.employee_type TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.employee_type FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_employee_type_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.employee_type FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_employee_type_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.employee_type FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_employee_type_u();
GO 
