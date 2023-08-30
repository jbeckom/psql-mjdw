CREATE OR REPLACE FUNCTION powerapps.tr_audit_email_u ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_email(
		 email_source
		,source_type
		,source_key
		,source_email_type 
		,old_email_type 
		,new_email_type
		,old_email
		,new_email 
		,old_email_owner
		,new_email_owner
		,old_status
		,new_status
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.email_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_email_type 
			,OLD.email_type
			,NEW.email_type 
			,OLD.email
			,NEW.email
			,OLD.email_owner
			,NEW.email_owner
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
ALTER FUNCTION powerapps.tr_audit_email_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_email_u TO rl_powerapps_x;
GO