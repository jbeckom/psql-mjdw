CREATE OR REPLACE FUNCTION powerapps.tr_audit_email_i ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_email(
		 email_source
		,source_type
		,source_key
		,source_email_type 
		,new_email_type 
		,new_email
		,new_email_owner
		,new_status
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.email_source
			,NEW.source_type
			,NEW.source_key
			,NEW.source_email_type 
			,NEW.email_type
			,NEW.email
			,NEW.email_owner
			,NEW.status
			,NEW.status_reason
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_email_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_email_i TO rl_powerapps_x;
GO