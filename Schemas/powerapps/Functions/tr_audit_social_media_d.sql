CREATE FUNCTION powerapps.tr_audit_social_media_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_social_media (
		 old_social_media_source 
		,old_source_key 
		,old_social_media_type 
		,old_url 
		,old_modify_dt 
		,old_is_dirty 
		,guid 
		,audit_action 
	)
	SELECT 	 OLD.social_media_source 
			,OLD.source_key 
			,OLD.social_media_type 
			,OLD.url 
			,OLD.modify_dt 
			,OLD.is_dirty 
			,OLD.guid 
			,'D';
	RETURN OLD;
END;
$$; 
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_social_media_d() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_social_media_d() TO rl_powerapps_x;
GO 
