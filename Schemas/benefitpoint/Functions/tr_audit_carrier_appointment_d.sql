CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_carrier_appointment_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_carrier_appointment (
		 carrier_source 
		,source_key 
		,carrier_appointment_id 
		,old_carrier_id 
		,old_appointment_on 
		,old_appointment_number 
		,old_states
		,old_active 
		,audit_action
	)
	SELECT 	 OLD.carrier_source
			,old.source_key 
			,OLD.carrier_appointment_id 
			,OLD.carrier_id 
			,OLD.appointment_on 
			,OLD.appointment_number 
			,old.states 
			,OLD.active 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_carrier_appointment_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_carrier_appointment_d() TO rl_benefitpoint_x;
GO 
