CREATE FUNCTION powerapps.tr_audit_account_social_media_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account_social_media(
		 old_account_guid 
		,old_social_media_guid 
		,old_account_social_media_owner 
		,old_status 
		,old_status_reason 
		,guid 
		,old_modify_dt 
		,old_is_dirty 
		,audit_action 
	)
	SELECT 	 OLD.account_guid 
			,OLD.social_media_guid 
			,OLD.account_social_media_owner 
			,OLD.status 
			,OLD.status_reason 
			,OLD.guid 
			,OLD.modify_dt 
			,OLD.is_dirty 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_account_social_media_d() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_account_social_media_d() TO rl_powerapps_x;
GO 
