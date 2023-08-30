CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_division_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_division (
		 account_id 
		,division_id
		,old_code 
		,new_code 
		,old_name 
		,new_name 
		,old_payroll_cycle
		,new_payroll_cycle
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.division_id 
			,OLD.code 
			,NEW.code 
			,OLD."name" 
			,NEW."name"
			,OLD.payroll_cycle 
			,NEW.payroll_cycle 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_division_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_division_u() TO rl_benefitpoint_x;
GO 
