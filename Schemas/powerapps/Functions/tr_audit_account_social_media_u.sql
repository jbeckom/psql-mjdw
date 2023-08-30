CREATE FUNCTION powerapps.tr_audit_account_social_media_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account_social_media(
		 old_account_guid 
		,new_account_guid 
		,old_social_media_guid 
		,new_social_media_guid 
		,old_account_social_media_owner 
		,new_account_social_media_owner 
		,old_status 
		,new_status 
		,old_status_reason 
		,new_status_reason 
		,guid 
		,old_modify_dt 
		,new_modify_dt
		,old_is_dirty 
		,new_is_dirty 
		,audit_action 
	)
	SELECT 	 OLD.account_guid 
			,NEW.account_guid 
			,OLD.social_media_guid 
			,NEW.social_media_guid 
			,OLD.account_social_media_owner 
			,NEW.account_social_media_owner 
			,OLD.status 
			,NEW.status 
			,OLD.status_reason 
			,NEW.status_reason 
			,OLD.guid
			,OLD.modify_dt
			,NEW.modify_dt 
			,OLD.is_dirty 
			,NEW.is_dirty 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_account_social_media_u() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_account_social_media_u() TO rl_powerapps_x;
GO 
