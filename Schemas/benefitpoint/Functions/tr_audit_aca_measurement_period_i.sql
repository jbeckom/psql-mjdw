CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_aca_measurement_period_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_aca_measurement_period (
		 account_id 
		,measurement_period 
		,new_start_date 
		,new_end_date
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.measurement_period 
			,NEW.start_date 
			,NEW.end_date 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_aca_measurement_period_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_aca_measurement_period_i() TO rl_benefitpoint_x;
GO 
