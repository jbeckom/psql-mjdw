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

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_team_member_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_team_member_i() TO rl_benefitpoint_x;
GO 
