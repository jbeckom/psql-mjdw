CREATE OR REPLACE FUNCTION powerapps.tr_audit_address_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$

BEGIN 
	INSERT INTO powerapps.audit_address (
		 address_source
		,source_type
		,source_key
		,source_address_type 
		,old_address_type 
		,new_address_type 
		,old_street_1
		,new_street_1
		,old_street_2
		,new_street_2
		,old_city
		,new_city
		,old_state_province
		,new_state_province
		,old_zip_post_code
		,new_zip_post_code
		,old_country_region
		,new_country_region
		,old_address_owner
		,new_address_owner
		,old_status_cd
		,new_status_cd
		,old_status_reason
		,new_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.address_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_address_type 
			,OLD.address_type 
			,NEW.address_type 
			,OLD.street_1
			,NEW.street_1
			,OLD.street_2
			,NEW.street_2
			,OLD.city
			,NEW.city
			,OLD.state_province
			,NEW.state_province
			,OLD.zip_post_code
			,NEW.zip_post_code
			,OLD.country_region
			,NEW.country_region
			,OLD.address_owner
			,NEW.address_owner
			,OLD.status_cd
			,NEW.status_cd
			,OLD.status_reason
			,NEW.status_reason
			,OLD.guid
			,'U';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_address_u() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_address_u() TO rl_powerapps_x;
GO