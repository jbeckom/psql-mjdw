CREATE OR REPLACE FUNCTION powerapps.tr_audit_contact_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_contact (
		 contact_source
		,source_key
		,old_master_contact
		,old_first_name
		,old_last_name
		,old_contact_type
		,old_parent_account_guid
		,old_job_title
		,old_preferred_contact
		,old_gender
		,old_family_status
		,old_spouse_name
		,old_dob
		,old_anniversary
		,old_allow_email
		,old_follow_email
		,old_allow_bulk_email
		,old_allow_phone
		,old_allow_fax
		,old_allow_mail
		,old_description
		,old_contact_owner
		,old_status
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.contact_source
			,OLD.source_key
			,OLD.master_contact
			,OLD.first_name
			,OLD.last_name
			,OLD.contact_type
			,OLD.parent_account_guid
			,OLD.job_title
			,OLD.preferred_contact
			,OLD.gender
			,OLD.family_status
			,OLD.spouse_name
			,OLD.dob
			,OLD.anniversary
			,OLD.allow_email
			,OLD.follow_email
			,OLD.allow_bulk_email
			,OLD.allow_phone
			,OLD.allow_fax
			,OLD.allow_mail
			,OLD.description
			,OLD.contact_owner
			,OLD.status
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_contact_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_contact_d TO rl_powerapps_x;
GO