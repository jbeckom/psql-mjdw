CREATE TABLE IF NOT EXISTS benefitpoint.tam_customer (
	 account_id 			int 		NOT NULL 
	,customer_code 			varchar(7) 	NOT NULL 
	,customer_class_code 	TEXT 		NULL 
	,branch_code 			TEXT 		NULL 
	,agency_code 			TEXT 		NULL 
	,branch_name 			TEXT 		NULL 
	,agency_name 			TEXT 		NULL 
	,office_id 				int 		NULL 
	,CONSTRAINT tam_customer_pkey PRIMARY KEY (account_id, customer_code)
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id) ON DELETE CASCADE 
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.tam_customer OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.tam_customer TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.tam_customer TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.tam_customer TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.tam_customer FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_tam_customer_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.tam_customer FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_tam_customer_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.tam_customer FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_tam_customer_u();
GO 
