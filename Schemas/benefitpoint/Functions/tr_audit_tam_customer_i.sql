CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_tam_customer_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_tam_customer (
		 account_id
		,customer_code
		,new_customer_class_code
		,new_branch_code
		,new_agency_code
		,new_branch_name
		,new_agency_name
		,new_office_id
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.customer_code
			,NEW.customer_class_code
			,NEW.branch_code
			,NEW.agency_code
			,NEW.branch_name
			,NEW.agency_name
			,NEW.office_id
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_tam_customer_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_tam_customer_i() TO rl_benefitpoint_x;
GO 
