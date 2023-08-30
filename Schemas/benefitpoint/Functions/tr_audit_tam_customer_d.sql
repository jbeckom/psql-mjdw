CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_tam_customer_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_tam_customer (
		 account_id
		,customer_code
		,old_customer_class_code
		,old_branch_code
		,old_agency_code
		,old_branch_name
		,old_agency_name
		,old_office_id
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.customer_code
			,OLD.customer_class_code
			,OLD.branch_code
			,OLD.agency_code
			,OLD.branch_name
			,OLD.agency_name
			,OLD.office_id
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_tam_customer_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_tam_customer_d() TO rl_benefitpoint_x;
GO 
