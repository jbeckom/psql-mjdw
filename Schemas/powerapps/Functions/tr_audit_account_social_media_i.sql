CREATE FUNCTION powerapps.tr_audit_account_social_media_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account_social_media(
		 new_account_guid 
		,new_social_media_guid 
		,new_account_social_media_owner 
		,new_status 
		,new_status_reason 
		,guid 
		,new_modify_dt 
		,new_is_dirty 
		,audit_action 
	)
	SELECT 	 NEW.account_guid 
			,NEW.social_media_guid 
			,NEW.account_social_media_owner 
			,NEW.status 
			,NEW.status_reason 
			,NEW.guid 
			,NEW.modify_dt 
			,NEW.is_dirty 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_account_social_media_i() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_account_social_media_i() TO rl_powerapps_x;
GO 
