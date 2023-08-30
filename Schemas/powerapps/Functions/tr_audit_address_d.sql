CREATE OR REPLACE FUNCTION powerapps.tr_audit_address_d() 
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
		,old_street_1
		,old_street_2
		,old_city
		,old_state_province
		,old_zip_post_code
		,old_country_region
		,old_address_owner
		,old_status_cd
		,old_status_reason
		,guid
		,audit_action
	)
	SELECT 	 OLD.address_source
			,OLD.source_type
			,OLD.source_key
			,OLD.source_address_type 
			,OLD.address_type
			,OLD.street_1
			,OLD.street_2
			,OLD.city
			,OLD.state_province
			,OLD.zip_post_code
			,OLD.country_region
			,OLD.address_owner
			,OLD.status_cd
			,OLD.status_reason
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_address_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_address_d TO rl_powerapps_x;
GO