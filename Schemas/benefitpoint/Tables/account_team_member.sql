CREATE TABLE benefitpoint.account_team_member (
	 account_id 			int 		NOT NULL 
	,user_id 				int 		NOT NULL 
	,first_name 			TEXT 		NULL 
	,last_name 				TEXT 		NULL 
	,email 					TEXT 		NULL 
	,broker_client_role_id 	int 		NOT NULL 
	,administrator 			bool 		NULL 
	,primary_contact 		bool 		NULL 
	,office 				int 		NULL 
	,team_role_primary 		bool 		NULL 
	,CONSTRAINT account_team_member_pkey PRIMARY KEY (account_id, user_id)
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.account_team_member OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.account_team_member TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.account_team_member TO rl_benefitpoint_a;
GO 

GRANT UPDATE ON TABLE benefitpoint.account_team_member TO rl_benefitpoint_w;
GO 

/*** TRIGGERS ***/
CREATE TRIGGER audit_d AFTER DELETE ON benefitpoint.account_team_member FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_team_member_d();
GO 

CREATE TRIGGER audit_i AFTER INSERT ON benefitpoint.account_team_member FOR EACH ROW EXECUTE FUNCTION benefitpoint.tr_audit_account_team_member_i();
GO 

CREATE TRIGGER audit_u AFTER UPDATE ON benefitpoint.account_team_member FOR EACH ROW WHEN (OLD IS DISTINCT FROM NEW) EXECUTE FUNCTION benefitpoint.tr_audit_account_team_member_u();
GO 
