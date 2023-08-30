CREATE OR REPLACE FUNCTION powerapps.tr_audit_tag_detail_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_tag_detail(
		 old_tag_name 
		,new_tag_name 
		,old_tag_type 
		,new_tag_type 
		,old_tag_owner
		,new_tag_owner 
		,old_status 
		,new_status 
		,old_modify_dt 
		,new_modify_dt 
		,guid 
		,old_is_dirty 
		,new_is_dirty 
		,audit_action 
	)
	SELECT 	 OLD.tag_name 
			,NEW.tag_name 
			,OLD.tag_type 
			,NEW.tag_type 
			,OLD.tag_owner 
			,NEW.tag_owner 
			,OLD.status 
			,NEW.status 
			,OLD.modify_dt 
			,NEW.modify_dt 
			,OLD.guid 
			,OLD.is_dirty 
			,NEW.is_dirty 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_tag_detail_u() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_tag_detail_u() TO rl_powerapps_x;
GO 
