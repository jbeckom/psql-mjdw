CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,old_active
		,new_active
		,old_inactive_as_of
		,new_inactive_as_of
		,old_inactive_reason
		,new_inactive_reason
		,old_account_classification
		,new_account_classification
		,old_account_type
		,new_account_type
		,old_office_id
		,new_office_id
		,old_department_id
		,new_department_id
		,old_administrator_user_id
		,new_administrator_user_id
		,old_primary_contact_user_id
		,new_primary_contact_user_id
		,old_primary_sales_lead_user_id
		,new_primary_sales_lead_user_id
		,old_primary_service_lead_user_id
		,new_primary_service_lead_user_id
		,old_notes
		,new_notes
		,old_last_reviewed_by_user_id
		,new_last_reviewed_by_user_id
		,old_last_reviewed_on
		,new_last_reviewed_on
		,old_created_on
		,new_created_on
		,old_last_modified_on
		,new_last_modified_on
		,old_excluded_purge
		,new_excluded_purge
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.active
			,NEW.active
			,OLD.inactive_as_of
			,NEW.inactive_as_of
			,OLD.inactive_reason
			,NEW.inactive_reason
			,OLD.account_classification
			,NEW.account_classification
			,OLD.account_type
			,NEW.account_type
			,OLD.office_id
			,NEW.office_id
			,OLD.department_id
			,NEW.department_id
			,OLD.administrator_user_id
			,NEW.administrator_user_id
			,OLD.primary_contact_user_id
			,NEW.primary_contact_user_id
			,OLD.primary_sales_lead_user_id
			,NEW.primary_sales_lead_user_id
			,OLD.primary_service_lead_user_id
			,NEW.primary_service_lead_user_id
			,OLD.notes
			,NEW.notes
			,OLD.last_reviewed_by_user_id
			,NEW.last_reviewed_by_user_id
			,OLD.last_reviewed_on
			,NEW.last_reviewed_on
			,OLD.created_on
			,NEW.created_on
			,OLD.last_modified_on
			,NEW.last_modified_on
			,OLD.excluded_purge
			,NEW.excluded_purge
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_u() TO rl_benefitpoint_x;
GO 
