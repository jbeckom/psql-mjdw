CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_user_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_user (
		 user_id 
		,old_username 
		,new_username 
		,old_first_name 
		,new_first_name 
		,old_last_name 
		,new_last_name 
		,old_title 
		,new_title 
		,old_office_id 
		,new_office_id 
		,old_last_modified_on 
		,new_last_modified_on 
		,old_last_login_on 
		,new_last_login_on 
		,old_last_lockout_on 
		,new_last_lockout_on 
		,old_roles 
		,new_roles 
		,old_created_on 
		,new_created_on 
		,old_notes 
		,new_notes 
		,audit_action
	)
	SELECT 	 OLD.user_id 
			,OLD.username 
			,NEW.username 
			,OLD.first_name 
			,NEW.first_name 
			,OLD.last_name 
			,NEW.last_name 
			,OLD.title 
			,NEW.title 
			,OLD.office_id 
			,NEW.office_id 
			,OLD.last_modified_on 
			,NEW.last_modified_on 
			,OLD.last_login_on 
			,NEW.last_login_on 
			,OLD.last_lockout_on 
			,NEW.last_lockout_on 
			,OLD.roles 
			,NEW.roles 
			,OLD.created_on 
			,NEW.created_on 
			,OLD.notes 
			,NEW.notes 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_user_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_user_u() TO rl_benefitpoint_x;
GO 
