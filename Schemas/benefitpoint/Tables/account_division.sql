CREATE TABLE IF NOT EXISTS benefitpoint.account_division (
	 account_id 	int 	NOT NULL 
	,division_id 	int 	NOT NULL 
	,code 			TEXT 	NULL 
	,"name" 		TEXT 	NULL 
	,payroll_cycle 	TEXT 	NULL 
	,CONSTRAINT account_division_pkey PRIMARY KEY (account_id, division_id)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_division OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account_division TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.account_division TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account_division TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account_division FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_division_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account_division FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_division_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account_division FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_division_u();
GO 
