CREATE OR REPLACE FUNCTION powerapps.tr_audit_phone_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_phone(
		 phone_source
		,source_type
		,source_key
		,source_phone_type
		,old_phone_type 
		,new_phone_type
		,old_phone
		,new_phone 
		,old_phone_owner
		,new_phone_owner
		,old_status
		,new_status
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.phone_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_phone_type 
			,OLD.phone_type 
			,NEW.phone_type
			,OLD.phone
			,NEW.phone
			,OLD.phone_owner
			,NEW.phone_owner
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
ALTER FUNCTION powerapps.tr_audit_phone_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_phone_u TO rl_powerapps_X;
GO