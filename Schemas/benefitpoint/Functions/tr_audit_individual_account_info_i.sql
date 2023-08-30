CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_individual_account_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_individual_account_info (
		 account_id
		,new_email
		,new_affiliated_group_account_id
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.email
			,NEW.affiliated_group_account_id
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_individual_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_individual_account_info_i() TO rl_benefitpoint_x;
GO 
