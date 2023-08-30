CREATE OR REPLACE FUNCTION powerapps.tr_audit_phone_d()
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
		,old_phone
		,old_phone_owner
		,old_status
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.phone_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_phone_type 
			,OLD.phone_type 
			,OLD.phone
			,OLD.phone_owner
			,OLD.status
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_phone_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_phone_d TO rl_powerapps_x;
GO