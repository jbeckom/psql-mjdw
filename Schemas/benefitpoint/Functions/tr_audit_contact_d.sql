CREATE FUNCTION benefitpoint.tr_audit_contact_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_contact(
		 contact_id 
		,old_first_name 
		,old_last_name 
		,old_email 
		,contact_source 
		,source_key 
		,audit_action 
	)
	
	SELECT 	 OLD.contact_id 
			,OLD.first_name 
			,OLD.last_name 
			,OLD.email 
			,OLD.contact_source 
			,OLD.source_key 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_contact_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_contact_d() TO rl_benefitpoint_x;
GO 
