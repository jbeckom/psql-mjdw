CREATE OR REPLACE FUNCTION powerapps.tr_audit_fax_u()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO powerapps.audit_fax(
		 fax_source
		,source_type
		,source_key
		,source_fax_type
		,old_fax_type 
		,new_fax_type 
		,old_fax
		,new_fax
		,old_fax_owner
		,new_fax_owner
		,old_status
		,new_status
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.fax_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_fax_type
			,OLD.fax_type 
			,NEW.fax_type
			,OLD.fax
			,NEW.fax 
			,OLD.fax_owner
			,NEW.fax_owner
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
ALTER FUNCTION powerapps.tr_audit_fax_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_fax_u TO rl_powerapps_x;
GO