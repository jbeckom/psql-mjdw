CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_common_group_account_info_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_common_group_account_info (
		 account_id
		,old_number_of_retirees
		,new_number_of_retirees
		,old_number_of_retirees_as_of
		,new_number_of_retirees_as_of
		,old_year_established
		,new_year_established
		,old_account_funding_type
		,new_account_funding_type
		,old_primary_industry
		,new_primary_industry
		,old_secondary_industry
		,new_secondary_industry
		,old_other_primary_industry
		,new_other_primary_industry
		,old_other_secondary_industry
		,new_other_secondary_industry
		,old_tax_payer_id
		,new_tax_payer_id
		,old_website
		,new_website
		,audit_action
	)
	SELECT 	 OLD.account_id
			,OLD.number_of_retirees
			,NEW.number_of_retirees
			,OLD.number_of_retirees_as_of
			,NEW.number_of_retirees_as_of
			,OLD.year_established
			,NEW.year_established
			,OLD.account_funding_type
			,NEW.account_funding_type
			,OLD.primary_industry
			,NEW.primary_industry
			,OLD.secondary_industry
			,NEW.secondary_industry
			,OLD.other_primary_industry
			,NEW.other_primary_industry
			,OLD.other_secondary_industry
			,NEW.other_secondary_industry
			,OLD.tax_payer_id
			,NEW.tax_payer_id
			,OLD.website
			,NEW.website
			,'U';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_common_group_account_info_u() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_common_group_account_info_u() TO rl_benefitpoint_x;
GO 
