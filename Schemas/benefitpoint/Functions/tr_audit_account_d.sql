CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account (
		 account_id
		,old_active
		,old_inactive_as_of
		,old_inactive_reason
		,old_account_classification
		,old_account_type
		,old_office_id
		,old_department_id
		,old_administrator_user_id
		,old_primary_contact_user_id
		,old_primary_sales_lead_user_id
		,old_primary_service_lead_user_id
		,old_notes
		,old_last_reviewed_by_user_id
		,old_last_reviewed_on
		,old_created_on
		,old_last_modified_on
		,old_excluded_purge
		,audit_action 
	)
	SELECT 	 OLD.account_id
			,OLD.active
			,OLD.inactive_as_of
			,OLD.inactive_reason
			,OLD.account_classification
			,OLD.account_type
			,OLD.office_id
			,OLD.department_id
			,OLD.administrator_user_id
			,OLD.primary_contact_user_id
			,OLD.primary_sales_lead_user_id
			,OLD.primary_service_lead_user_id
			,OLD.notes
			,OLD.last_reviewed_by_user_id
			,OLD.last_reviewed_on
			,OLD.created_on
			,OLD.last_modified_on
			,OLD.excluded_purge
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_d() TO rl_benefitpoint_x;
GO 
