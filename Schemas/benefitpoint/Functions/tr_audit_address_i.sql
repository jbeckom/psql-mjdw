CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_address_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_address (
		 address_source
		,source_type 
		,source_key 
		,new_street_1 
		,new_street_2 
		,new_city 
		,new_state 
		,new_zip 
		,new_country 
		,audit_action 
	)
	SELECT 	 NEW.address_source 
			,NEW.source_type 
			,NEW.source_key 
			,NEW.street_1 
			,NEW.street_2 
			,NEW.city 
			,NEW.state 
			,NEW.zip 
			,NEW.country 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_address_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_address_i() TO rl_benefitpoint_x;
GO 
