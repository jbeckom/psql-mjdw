CREATE FUNCTION powerapps.tr_audit_social_media_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_social_media (
		 new_social_media_source 
		,new_source_key 
		,new_social_media_type 
		,new_url 
		,new_modify_dt 
		,new_is_dirty 
		,guid 
		,audit_action 
	)
	SELECT 	 NEW.social_media_source 
			,NEW.source_key 
			,NEW.social_media_type 
			,NEW.url 
			,NEW.modify_dt 
			,NEW.is_dirty 
			,NEW.guid 
			,'I';
	RETURN NEW;
END;
$$; 
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_social_media_i() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_social_media_i() TO rl_powerapps_x;
GO 
