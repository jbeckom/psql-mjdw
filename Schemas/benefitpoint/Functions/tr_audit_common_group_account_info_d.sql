CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_common_group_account_info_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_common_group_account_info (
		 account_id
		,old_number_of_retirees
		,old_number_of_retirees_as_of
		,old_year_established
		,old_account_funding_type
		,old_primary_industry
		,old_secondary_industry
		,old_other_primary_industry
		,old_other_secondary_industry
		,old_tax_payer_id
		,old_website
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.number_of_retirees
			,OLD.number_of_retirees_as_of
			,OLD.year_established
			,OLD.account_funding_type
			,OLD.primary_industry
			,OLD.secondary_industry
			,OLD.other_primary_industry
			,OLD.other_secondary_industry
			,OLD.tax_payer_id
			,OLD.website
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_common_group_account_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_common_group_account_info_d() TO rl_benefitpoint_x;
GO 
