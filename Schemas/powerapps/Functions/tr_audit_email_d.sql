CREATE OR REPLACE FUNCTION powerapps.tr_audit_email_d ()
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
		,old_email
		,old_email_owner
		,old_status
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.email_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_email_type 
			,OLD.email_type
			,OLD.email
			,OLD.email_owner
			,OLD.status
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_email_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_email_d TO rl_powerapps_x;
GO