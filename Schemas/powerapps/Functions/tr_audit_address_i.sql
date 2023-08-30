CREATE OR REPLACE FUNCTION powerapps.tr_audit_address_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO powerapps.audit_address (
		 address_source
		,source_type
		,source_key
		,source_address_type 
		,new_address_type 
		,new_street_1
		,new_street_2
		,new_city
		,new_state_province
		,new_zip_post_code
		,new_country_region
		,new_address_owner
		,new_status_cd
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 NEW.address_source
			,NEW.source_type
			,NEW.source_key 
			,NEW.source_address_type 
			,NEW.address_type
			,NEW.street_1
			,NEW.street_2
			,NEW.city
			,NEW.state_province
			,NEW.zip_post_code
			,NEW.country_region
			,NEW.address_owner
			,NEW.status_cd
			,NEW.status_reason
			,NEW.guid
			,'N';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_address_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_address_i TO rl_powerapps_x;
GO