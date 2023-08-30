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

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_team_member_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_team_member_d() TO rl_benefitpoint_x;
GO 
