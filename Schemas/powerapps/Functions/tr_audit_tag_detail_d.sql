CREATE FUNCTION powerapps.tr_audit_tag_detail_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_tag_detail(
		 old_tag_name 
		,old_tag_type 
		,old_tag_owner 
		,old_status 
		,old_modify_dt 
		,guid 
		,old_is_dirty 
		,audit_action 
	)
	SELECT 	 OLD.tag_name 
			,OLD.tag_type 
			,OLD.tag_owner 
			,OLD.status 
			,OLD.modify_dt 
			,OLD.guid 
			,OLD.is_dirty 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_tag_detail_d() OWNER TO mj_admin;
GO 
GRANT EXECUTE ON FUNCTION powerapps.tr_audit_tag_detail_d() TO rl_powerapps_x;
GO 
