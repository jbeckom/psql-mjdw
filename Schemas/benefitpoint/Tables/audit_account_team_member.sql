CREATE TABLE benefitpoint.audit_account_team_member (
	 account_id 			    int 		NOT NULL 
	,user_id 				    int 		NOT NULL 
	,old_first_name 			TEXT 		NULL 
	,new_first_name 			TEXT 		NULL 
	,old_last_name 				TEXT 		NULL 
	,new_last_name 				TEXT 		NULL 
	,old_email 					TEXT 		NULL 
	,new_email 					TEXT 		NULL 
	,old_broker_client_role_id 	int 		NULL 
	,new_broker_client_role_id 	int 		NULL 
	,old_administrator 			bool 		NULL 
	,new_administrator 			bool 		NULL 
	,old_primary_contact 		bool 		NULL 
	,new_primary_contact 		bool 		NULL 
	,old_office 				int 		NULL 
	,new_office 				int 		NULL 
	,old_team_role_primary 		bool 		NULL 
	,new_team_role_primary 		bool 		NULL 
	,audit_action 				char(1) 	NOT NULL 
	,audit_user 				TEXT 		NOT NULL 	DEFAULT current_user 
	,audit_timestamp 			timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp())
	,audit_id 					bigint 		NOT NULL 	GENERATED ALWAYS AS identity
);
GO 

/*** PERMISSIONS ***/
ALTER TABLE benefitpoint.audit_account_team_member OWNER TO mj_admin;
GO 

GRANT SELECT ON TABLE benefitpoint.audit_account_team_member TO rl_benefitpoint_r;
GO 

GRANT INSERT ON TABLE benefitpoint.audit_account_team_member TO rl_benefitpoint_a;
GO 