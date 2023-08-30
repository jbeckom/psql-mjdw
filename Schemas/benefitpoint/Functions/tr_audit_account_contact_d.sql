CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_contact_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO benefitpoint.audit_account_contact (
		 account_id 
		,old_title 
		,old_additional_info 
		,old_primary_contact 
		,old_primary_location_id 
		,old_notes 
		,old_last_modified_on 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.title 
			,OLD.additional_info 
			,OLD.primary_contact 
			,OLD.primary_location_id 
			,OLD.notes 
			,OLD.last_modified_on 
			,'D';
		
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_contact_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_contact_d() TO rl_benefitpoint_x;
GO 
