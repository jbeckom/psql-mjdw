CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,old_title 
		,new_title 
		,old_additional_info 
		,new_additional_info 
		,old_primary_contact 
		,new_primary_contact 
		,old_primary_location_id 
		,new_primary_location_id 
		,old_notes 
		,new_notes 
		,old_last_modified_on 
		,new_last_modified_on 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.title 
			,NEW.title 
			,OLD.additional_info 
			,NEW.additional_info 
			,OLD.primary_contact 
			,NEW.primary_contact 
			,OLD.primary_location_id 
			,NEW.primary_location_id 
			,OLD.notes 
			,NEW.notes 
			,OLD.last_modified_on 
			,NEW.last_modified_on 
			,'U';
		
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_contact_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_contact_u() TO rl_benefitpoint_x;
GO 
