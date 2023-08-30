CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_employee_type_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_employee_type (
		 account_id 
		,employee_type_id
		,old_status
		,new_status
		,old_type
		,new_type
		,old_value
		,new_value 
		,old_unit_of_measure
		,new_unit_of_measure 
		,old_frequency
		,new_frequency 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.employee_type_id
			,OLD.status
			,NEW.status 
			,OLD."type"
			,NEW."type" 
			,OLD.value
			,NEW.value 
			,OLD.unit_of_measure
			,NEW.unit_of_measure 
			,OLD.frequency
			,NEW.frequency 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_employee_type_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_employee_type_u() TO rl_benefitpoint_x;
GO 
