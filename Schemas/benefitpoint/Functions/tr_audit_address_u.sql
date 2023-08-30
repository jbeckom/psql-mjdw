CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_address_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_address (
		 address_source 
		,source_type 
		,source_key 
		,old_street_1 
		,new_street_1 
		,old_street_2 
		,new_street_2 
		,old_city 
		,new_city 
		,old_state 
		,new_state 
		,old_zip 
		,new_zip 
		,old_country 
		,new_country 
		,audit_action 
	)
	SELECT 	 OLD.address_source 
			,OLD.source_type 
			,OLD.source_key 
			,OLD.street_1 
			,NEW.street_1 
			,OLD.street_2 
			,NEW.street_2 
			,OLD.city 
			,NEW.city 
			,OLD.state 
			,NEW.state 
			,OLD.zip 
			,NEW.zip 
			,OLD.country 
			,NEW.country 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_address_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_address_u() TO rl_benefitpoint_x;
GO 
