CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_employee_type_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_employee_type (
		 account_id
		,employee_type_id
		,new_status
		,new_type
		,new_value
		,new_unit_of_measure
		,new_frequency 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.employee_type_id
			,NEW.status
			,NEW."type"
			,NEW.value
			,NEW.unit_of_measure
			,NEW.frequency 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_employee_type_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_employee_type_i() TO rl_benefitpoint_x;
GO 
