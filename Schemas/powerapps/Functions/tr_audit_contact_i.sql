CREATE OR REPLACE FUNCTION powerapps.tr_audit_contact_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_contact (
		 contact_source
		,source_key
		,new_master_contact
		,new_first_name
		,new_last_name
		,new_contact_type
		,new_parent_account_guid
		,new_job_title
		,new_preferred_contact
		,new_gender
		,new_family_status
		,new_spouse_name
		,new_dob
		,new_anniversary
		,new_allow_email
		,new_follow_email
		,new_allow_bulk_email
		,new_allow_phone
		,new_allow_fax
		,new_allow_mail
		,new_description
		,new_contact_owner
		,new_status
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.contact_source
			,NEW.source_key
			,NEW.master_contact 
			,NEW.first_name
			,NEW.last_name
			,NEW.contact_type
			,NEW.parent_account_guid
			,NEW.job_title
			,NEW.preferred_contact
			,NEW.gender
			,NEW.family_status
			,NEW.spouse_name
			,NEW.dob
			,NEW.anniversary
			,NEW.allow_email
			,NEW.follow_email
			,NEW.allow_bulk_email
			,NEW.allow_phone
			,NEW.allow_fax
			,NEW.allow_mail
			,NEW.description
			,NEW.contact_owner
			,NEW.status
			,NEW.status_reason
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_contact_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_contact_i TO rl_powerapps_x;
GO