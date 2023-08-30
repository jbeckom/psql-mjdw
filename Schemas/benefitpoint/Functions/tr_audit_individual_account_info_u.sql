CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_individual_account_info_u() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_individual_account_info (
		 account_id
		,old_email
		,new_email 
		,old_affiliated_group_account_id 
		,new_afiiliated_group_account_id
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.email
			,NEW.email 
			,OLD.affiliated_group_account_id 
			,NEW.affilaited_group_account_id
			,'U';
	RETURN OLD, NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_individual_account_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_individual_account_info_u() TO rl_benefitpoint_x;
GO 
