CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 carrier_source
		,source_key 
		,carrier_appointment_id 
		,old_carrier_id 
		,new_carrier_id 
		,old_appointment_on 
		,new_appointment_on
		,old_appointment_number 
		,new_appointment_number 
		,old_states 
		,new_states 
		,old_active 
		,new_active
		,audit_action
	)
	SELECT 	 OLD.carrier_source 
			,old.source_key  
			,OLD.carrier_appointment_id 
			,OLD.carrier_id 
			,new.carrier_id 
			,OLD.appointment_on 
			,NEW.appointment_on
			,OLD.appointment_number 
			,NEW.appointment_number 
			,old.states 
			,new.states 
			,OLD.active 
			,NEW.active
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_appointment_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_appointment_u() TO rl_benefitpoint_x;
GO 
