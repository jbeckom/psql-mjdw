CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_common_group_account_info_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_common_group_account_info (
		 account_id
		,new_number_of_retirees
		,new_number_of_retirees_as_of
		,new_year_established
		,new_account_funding_type
		,new_primary_industry
		,new_secondary_industry
		,new_other_primary_industry
		,new_other_secondary_industry
		,new_tax_payer_id
		,new_website
		,audit_action
	)
	SELECT 	 NEW.account_id
			,NEW.number_of_retirees
			,NEW.number_of_retirees_as_of
			,NEW.year_established
			,NEW.account_funding_type
			,NEW.primary_industry
			,NEW.secondary_industry
			,NEW.other_primary_industry
			,NEW.other_secondary_industry
			,NEW.tax_payer_id
			,NEW.website
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.tr_audit_common_group_account_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.tr_audit_common_group_account_info_i() TO rl_benefitpoint_x;
GO 
