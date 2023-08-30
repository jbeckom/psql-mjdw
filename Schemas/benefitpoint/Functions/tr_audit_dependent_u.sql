CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_dependent_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_dependent (
		 account_id 
		,dependent_id 
		,old_relationship 
		,new_relationship 
		,audit_action 
	)
	SELECT 	 OLD.account_id
			,OLD.dependent_id 
			,OLD.relationship 
			,NEW.relationship 
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_dependent_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_dependent_u() TO rl_benefitpoint_x;
GO 
