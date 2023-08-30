CREATE TABLE IF NOT EXISTS benefitpoint.agent_account_info (
	 agency_account_id 		int 	NOT NULL 
	,account_id 			int 	NOT NULL 
	,CONSTRAINT account_fkey FOREIGN KEY (account_id) REFERENCES benefitpoint.account (account_id)
	,CONSTRAINT agent_account_pkey PRIMARY KEY (account_id)
);

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.agent_account_info OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.agent_account_info TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.agent_account_info TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.agent_account_info TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.agent_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agent_account_info_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.agent_account_info FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_agent_account_info_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.agent_account_info FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_agent_account_info_u();
GO 
