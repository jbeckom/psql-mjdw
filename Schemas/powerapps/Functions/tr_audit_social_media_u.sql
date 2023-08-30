CREATE OR REPLACE FUNCTION powerapps.tr_audit_social_media_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_social_media (
		 old_social_media_source 
		,new_social_media_source 
		,old_source_key 
		,new_source_key 
		,old_social_media_type 
		,new_social_media_type 
		,old_url 
		,new_url 
		,old_modify_dt 
		,new_modify_dt 
		,old_is_dirty 
		,new_is_dirty 
		,guid 
		,audit_action 
	)
	SELECT 	 OLD.social_media_source 
			,NEW.social_media_source 
			,OLD.source_key 
			,NEW.source_key 
			,OLD.social_media_type 
			,NEW.social_media_type 
			,OLD.url 
			,NEW.url
			,OLD.modify_dt 
			,NEW.modify_dt 
			,OLD.is_dirty 
			,NEW.is_dirty
			,OLD.guid 
			,'U';
	RETURN OLD;
END;
$$; 
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_social_media_u() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_social_media_u() TO rl_powerapps_x;
GO 
