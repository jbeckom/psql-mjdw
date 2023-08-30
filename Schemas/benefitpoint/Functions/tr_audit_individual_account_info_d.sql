CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_individual_account_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_individual_account_info (
		 account_id
		,old_email
		,old_affiliated_group_account_id
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.email
			,OLD.affiliated_group_account_id
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_individual_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_individual_account_info_d() TO rl_benefitpoint_x;
GO 
