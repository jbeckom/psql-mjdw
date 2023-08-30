CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_aca_measurement_period_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_aca_measurement_period (
		 account_id 
		,measurement_period 
		,old_start_date 
		,old_end_date
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.measurement_period 
			,OLD.start_date 
			,OLD.end_date 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_aca_measurement_period_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_aca_measurement_period_d() TO rl_benefitpoint_x;
GO 
