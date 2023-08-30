CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_division_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_division (
		 account_id
		,division_id
		,old_code 
		,old_name 
		,old_payroll_cycle
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.division_id 
			,OLD.code 
			,OLD."name" 
			,OLD.payroll_cycle
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_division_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_division_d() TO rl_benefitpoint_x;
GO 
