CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_user_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_user (
		 user_id 
		,new_username 
		,new_first_name 
		,new_last_name 
		,new_title 
		,new_office_id 
		,new_last_modified_on 
		,new_last_login_on 
		,new_last_lockout_on 
		,new_roles 
		,new_created_on 
		,new_notes 
		,audit_action
	)
	SELECT 	 NEW.user_id 
			,NEW.username 
			,NEW.first_name 
			,NEW.last_name 
			,NEW.title 
			,NEW.office_id 
			,NEW.last_modified_on 
			,NEW.last_login_on 
			,NEW.last_lockout_on 
			,NEW.roles 
			,NEW.created_on 
			,NEW.notes 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_user_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_user_i() TO rl_benefitpoint_x;
GO 
