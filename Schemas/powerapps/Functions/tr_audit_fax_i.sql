CREATE OR REPLACE FUNCTION powerapps.tr_audit_fax_i()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO powerapps.audit_fax(
		 fax_source
		,source_type
		,source_key
		,source_fax_type 
		,new_fax_type 
		,new_fax
		,new_fax_owner
		,new_status
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.fax_source
			,NEW.source_type
			,NEW.source_key
			,NEW.source_fax_type
			,NEW.fax_type 
			,NEW.fax
			,NEW.fax_owner
			,NEW.status
			,NEW.status_reason
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_fax_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_fax_i TO rl_powerapps_X;
GO