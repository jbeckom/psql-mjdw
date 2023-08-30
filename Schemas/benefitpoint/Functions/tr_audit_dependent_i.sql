CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_dependent_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_dependent (
		 account_id 
		,dependent_id 
		,new_relationship 
		,audit_action
	)
	SELECT 	 NEW.account_id 
			,NEW.dependent_id 
			,NEW.relationship 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_dependent_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_dependent_i() TO rl_benefitpoint_x;
GO 
