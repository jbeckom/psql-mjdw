CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,new_active
		,new_inactive_as_of
		,new_inactive_reason
		,new_account_classification
		,new_account_type
		,new_office_id
		,new_department_id
		,new_administrator_user_id
		,new_primary_contact_user_id
		,new_primary_sales_lead_user_id
		,new_primary_service_lead_user_id
		,new_notes
		,new_last_reviewed_by_user_id
		,new_last_reviewed_on
		,new_created_on
		,new_last_modified_on
		,new_excluded_purge
		,audit_action 
	)
	SELECT 	 NEW.account_id
			,NEW.active
			,NEW.inactive_as_of
			,NEW.inactive_reason
			,NEW.account_classification
			,NEW.account_type
			,NEW.office_id
			,NEW.department_id
			,NEW.administrator_user_id
			,NEW.primary_contact_user_id
			,NEW.primary_sales_lead_user_id
			,NEW.primary_service_lead_user_id
			,NEW.notes
			,NEW.last_reviewed_by_user_id
			,NEW.last_reviewed_on
			,NEW.created_on
			,NEW.last_modified_on
			,NEW.excluded_purge
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_i() TO rl_benefitpoint_x;
GO 
