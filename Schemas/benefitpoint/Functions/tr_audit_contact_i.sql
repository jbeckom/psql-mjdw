CREATE FUNCTION benefitpoint.tr_audit_contact_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_contact(
		 contact_id 
		,new_first_name 
		,new_last_name 
		,new_email 
		,contact_source 
		,source_key 
		,audit_action 
	)
	
	SELECT 	 NEW.contact_id 
			,NEW.first_name 
			,NEW.last_name 
			,NEW.email 
			,NEW.contact_source 
			,NEW.source_key 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_contact_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_contact_i() TO rl_benefitpoint_x;
GO 
