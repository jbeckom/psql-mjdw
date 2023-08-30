CREATE FUNCTION powerapps.tr_audit_tag_detail_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_tag_detail(
		 new_tag_name 
		,new_tag_type 
		,new_tag_owner 
		,new_status 
		,new_modify_dt 
		,guid 
		,new_is_dirty 
		,audit_action 
	)
	SELECT 	 NEW.tag_name 
			,NEW.tag_type 
			,NEW.tag_owner 
			,NEW.status 
			,NEW.modify_dt 
			,NEW.guid 
			,NEW.is_dirty 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_tag_detail_i() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_tag_detail_i() TO rl_powerapps_x;
GO 
