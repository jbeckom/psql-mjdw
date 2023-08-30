CREATE TABLE IF NOT EXISTS benefitpoint.dependent (
	 account_id 	int 			NOT NULL
	,dependent_id 	int 			NOT NULL 
	,relationship 	varchar(100) 	NULL  
	,CONSTRAINT dependent_pkey PRIMARY KEY (account_id, dependent_id)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.dependent OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.dependent TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.dependent TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.dependent TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.dependent FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_dependent_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.dependent FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_dependent_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.dependent FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_dependent_u();
GO 
