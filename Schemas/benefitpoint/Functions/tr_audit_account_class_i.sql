CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_account_class_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_account_class (
		 account_id 
		,class_id 
		,new_code 
		,new_name 
		,new_payroll_cycle 
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.class_id 
			,NEW.code 
			,NEW."name" 
			,NEW.payroll_cycle 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_account_class_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_account_class_i() TO rl_benefitpoint_x;
GO 
