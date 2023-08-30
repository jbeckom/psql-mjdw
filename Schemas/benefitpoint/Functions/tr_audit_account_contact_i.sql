CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,new_title 
		,new_additional_info 
		,new_primary_contact 
		,new_primary_location_id 
		,new_notes 
		,new_last_modified_on 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.title 
			,NEW.additional_info 
			,NEW.primary_contact 
			,NEW.primary_location_id 
			,NEW.notes 
			,NEW.last_modified_on 
			,'I';
		
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_contact_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_contact_i() TO rl_benefitpoint_x;
GO 
