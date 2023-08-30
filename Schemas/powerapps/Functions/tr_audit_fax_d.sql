CREATE OR REPLACE FUNCTION powerapps.tr_audit_fax_d()
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
		,old_fax
		,old_fax_owner
		,old_status
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.fax_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_fax_type 
			,OLD.fax_type
			,OLD.fax
			,OLD.fax_owner
			,OLD.status
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_fax_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_fax_d TO rl_powerapps_x;
GO