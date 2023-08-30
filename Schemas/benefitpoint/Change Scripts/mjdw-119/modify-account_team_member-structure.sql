/*************/
/*** TABLE ***/
/*************/
DROP TABLE IF EXISTS benefitpoint.account_team_member;
GO 

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

/*************/
/*** AUDIT ***/
/*************/
DROP TABLE IF EXISTS benefitpoint.audit_account_team_member;
GO 

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

/****************/
/*** TRIGGERS ***/
/****************/
CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_team_member_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_team_member (
		 account_id 
		,user_id 
		,old_first_name 
		,old_last_name 
		,old_email 
		,old_broker_client_role_id 
		,old_administrator 
		,old_primary_contact 
		,old_office 
		,old_team_role_primary 
		,audit_action 
	)
	
	SELECT 	 OLD.account_id 
			,OLD.user_id 
			,OLD.first_name 
			,OLD.last_name 
			,OLD.email 
			,OLD.broker_client_role_id 
			,OLD.administrator 
			,OLD.primary_contact 
			,OLD.office 
			,OLD.team_role_primary 
			,'D';
	
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_team_member_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_team_member (
		 account_id 
		,user_id 
		,new_first_name 
		,new_last_name 
		,new_email 
		,new_broker_client_role_id 
		,new_administrator 
		,new_primary_contact 
		,new_office 
		,new_team_role_primary 
		,audit_action 
	)
	
	SELECT 	 NEW.account_id 
			,NEW.user_id 
			,NEW.first_name 
			,NEW.last_name 
			,NEW.email 
			,NEW.broker_client_role_id 
			,NEW.administrator 
			,NEW.primary_contact 
			,NEW.office 
			,NEW.team_role_primary 
			,'I';
	
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_team_member_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_team_member (
		 account_id 
		,user_id 
		,old_first_name 
		,new_first_name 
		,old_last_name 
		,new_last_name 
		,old_email 
		,new_email 
		,old_broker_client_role_id 
		,new_broker_client_role_id 
		,old_administrator 
		,new_administrator 
		,old_primary_contact 
		,new_primary_contact 
		,old_office 
		,new_office 
		,old_team_role_primary 
		,new_team_role_primary 
		,audit_action 
	)
	
	SELECT 	 OLD.account_id 
			,OLD.user_id 
			,OLD.first_name 
			,NEW.first_name 
			,OLD.last_name 
			,NEW.last_name 
			,OLD.email 
			,NEW.email 
			,OLD.broker_client_role_id 
			,NEW.broker_client_role_id 
			,OLD.administrator 
			,NEW.administrator 
			,OLD.primary_contact 
			,NEW.primary_contact 
			,OLD.office 
			,NEW.office 
			,OLD.team_role_primary 
			,NEW.team_role_primary 
			,'U';
	
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_team_member_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_team_member_u() TO rl_benefitpoint_x;
GO 



/*****************/
/*** FUNCTIONS ***/
/*****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_account_team_member_upsert(int, int, text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_account_team_member_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.account_team_member (
		 account_id
		,user_id
		,first_name
		,last_name
		,email
		,broker_client_role_id
		,administrator
		,primary_contact 
		,office 
		,team_role_primary
	)
	SELECT 	 account_id
			,user_id
			,first_name
			,last_name
			,email
			,broker_client_role_id
			,administrator
			,primary_contact
			,office 
			,team_role_primary
	FROM 	benefitpoint.stg_account_team_member 
	ON CONFLICT (account_id, user_id) DO UPDATE 
	SET 	 first_name 			= excluded.first_name
			,last_name 				= excluded.last_name
			,email 					= excluded.email
			,broker_client_role_id 	= excluded.broker_client_role_id
			,administrator 			= excluded.administrator
			,primary_contact 		= excluded.primary_contact
			,office 				= excluded.office 
			,team_role_primary 		= excluded.team_role_primary
	WHERE 	(account_team_member.first_name,account_team_member.last_name,account_team_member.email,account_team_member.broker_client_role_id,account_team_member.administrator,account_team_member.primary_contact,account_team_member.office,account_team_member.team_role_primary) 
		IS DISTINCT FROM 	(excluded.first_name,excluded.last_name,excluded.email,excluded.broker_client_role_id,excluded.administrator,excluded.primary_contact,excluded.office,excluded.team_role_primary);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_account_team_member_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_account_team_member_upsert() TO rl_benefitpoint_x;
GO 
