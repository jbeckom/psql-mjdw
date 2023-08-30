CREATE FUNCTION benefitpoint.tr_audit_contact_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_contact(
		 contact_id 
		,old_first_name 
		,new_first_name 
		,old_last_name 
		,new_last_name 
		,old_email 
		,new_email 
		,contact_source 
		,source_key 
		,audit_action 
	)
	
	SELECT 	 OLD.contact_id 
			,OLD.first_name 
			,NEW.first_name 
			,OLD.last_name 
			,NEW.last_name 
			,OLD.email 
			,NEW.email 
			,OLD.contact_source 
			,OLD.source_key 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_contact_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_contact_u() TO rl_benefitpoint_x;
GO 
