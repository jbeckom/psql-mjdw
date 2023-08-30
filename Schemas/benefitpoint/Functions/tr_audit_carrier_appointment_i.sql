CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 carrier_source
		,source_key  
		,carrier_appointment_id 
		,new_carrier_id 
		,new_appointment_on 
		,new_appointment_number 
		,new_states 
		,new_active 
		,audit_action
	)
	SELECT 	 NEW.carrier_source
			,new.source_key  
			,NEW.carrier_appointment_id 
			,NEW.carrier_id 
			,NEW.appointment_on 
			,NEW.appointment_number 
			,new.states 
			,NEW.active 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_appointment_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_appointment_i() TO rl_benefitpoint_x;
GO 
