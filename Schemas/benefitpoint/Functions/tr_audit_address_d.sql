CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_address_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_address (
		 address_source
		,source_type
		,source_key
		,old_street_1 
		,old_street_2 
		,old_city 
		,old_state 
		,old_zip 
		,old_country 
		,audit_action 
	)
	SELECT 	 OLD.address_source
			,OLD.source_type
			,OLD.source_key
			,OLD.street_1 
			,OLD.street_2 
			,OLD.city 
			,OLD.state 
			,OLD.zip 
			,OLD.country 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_address_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_address_d() TO rl_benefitpoint_x;
GO 
