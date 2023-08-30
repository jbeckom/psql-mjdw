CREATE OR REPLACE FUNCTION powerapps.tr_audit_contact_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_contact (
		 contact_source
		,source_key
		,old_master_contact 
		,new_master_contact 
		,old_first_name
		,new_first_name
		,old_last_name
		,new_last_name
		,old_contact_type
		,new_contact_type
		,old_parent_account_guid
		,new_parent_account_guid
		,old_job_title
		,new_job_title
		,old_preferred_contact
		,new_preferred_contact
		,old_gender
		,new_gender
		,old_family_status
		,new_family_status
		,old_spouse_name
		,new_spouse_name
		,old_dob
		,new_dob
		,old_anniversary
		,new_anniversary
		,old_allow_email
		,new_allow_email
		,old_follow_email
		,new_follow_email
		,old_allow_bulk_email
		,new_allow_bulk_email
		,old_allow_phone
		,new_allow_phone
		,old_allow_fax
		,new_allow_fax
		,old_allow_mail
		,new_allow_mail
		,old_description
		,new_description
		,old_contact_owner
		,new_contact_owner
		,old_status
		,new_status
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.contact_source
			,OLD.source_key
			,OLD.master_contact 
			,NEW.master_contact
			,OLD.first_name
			,NEW.first_name
			,OLD.last_name
			,NEW.last_name
			,OLD.contact_type
			,NEW.contact_type
			,OLD.parent_account_guid
			,NEW.parent_account_guid
			,OLD.job_title
			,NEW.job_title
			,OLD.preferred_contact
			,NEW.preferred_contact
			,OLD.gender
			,NEW.gender
			,OLD.family_status
			,NEW.family_status
			,OLD.spouse_name
			,NEW.spouse_name
			,OLD.dob
			,NEW.dob
			,OLD.anniversary
			,NEW.anniversary
			,OLD.allow_email
			,NEW.allow_email
			,OLD.follow_email
			,NEW.follow_email
			,OLD.allow_bulk_email
			,NEW.allow_bulk_email
			,OLD.allow_phone
			,NEW.allow_phone
			,OLD.allow_fax
			,NEW.allow_fax
			,OLD.allow_mail
			,NEW.allow_mail
			,OLD.description
			,NEW.description
			,OLD.contact_owner
			,NEW.contact_owner
			,OLD.status
			,NEW.status
			,OLD.status_reason
			,NEW.status_reason
			,OLD.guid
			,'U';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_contact_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_contact_u TO rl_powerapps_x;
GO