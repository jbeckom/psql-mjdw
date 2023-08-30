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
