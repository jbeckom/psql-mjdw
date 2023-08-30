CREATE OR REPLACE FUNCTION powerapps.tr_audit_phone_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_phone(
		 phone_source
		,source_type
		,source_key 
		,source_phone_type 
		,new_phone_type 
		,new_phone
		,new_phone_owner
		,new_status
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.phone_source
			,NEW.source_type
			,NEW.source_key
			,NEW.source_phone_type 
			,NEW.phone_type 
			,NEW.phone 
			,NEW.phone_owner
			,NEW.status
			,NEW.status_reason
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_phone_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_phone_i TO rl_powerapps_x;
GO