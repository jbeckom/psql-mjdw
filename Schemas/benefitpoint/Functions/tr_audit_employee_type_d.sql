CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_employee_type_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_employee_type (
		 account_id 
		,employee_type_id
		,old_status
		,old_type
		,old_value
		,old_unit_of_measure
		,old_frequency 
		,audit_action
	)
	SELECT 	 OLD.account_id 
			,OLD.employee_type_id
			,OLD.status
			,OLD."type"
			,OLD.value
			,OLD.unit_of_measure
			,OLD.frequency 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_employee_type_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_employee_type_d() TO rl_benefitpoint_x;
GO 
