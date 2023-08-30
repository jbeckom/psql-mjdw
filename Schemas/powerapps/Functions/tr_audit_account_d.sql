CREATE OR REPLACE FUNCTION powerapps.tr_audit_account_d ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account (
		 account_source 
		,source_key 
		,old_account_name 
		,old_client_code 
		,old_client_category 
		,old_pc_client_category
		,old_medical_funding_type
		,old_enrolled_employees
		,old_bor_dt
		,old_erisa_info
		,old_stop_loss_reold_dt
		,old_industry
		,old_dba
		,old_eb_primary_sic
		,old_pc_primary_sic
		,old_pc_second_sic
		,old_pc_tertiary_sic
		,old_other_subsidiaries
		,old_pc_client_profile
		,old_eb_client_profile
		,old_eb_account_classification
		,old_client_rev_25k
		,old_revenue_range
		,old_ein
		,old_naics_description
		,old_web_url
		,old_parent_account
		,old_primary_contact
		,old_account_owner
		,old_status_code
		,old_status_reason
		,old_total_rewards_producer
		,guid
		,audit_action
	)
	SELECT 	 OLD.account_source 
			,OLD.source_key 
			,OLD.account_name 
			,OLD.client_code 
			,OLD.client_category 
			,OLD.pc_client_category
			,OLD.medical_funding_type
			,OLD.enrolled_employees
			,OLD.bor_dt
			,OLD.erisa_info
			,OLD.stop_loss_renew_dt
			,OLD.industry
			,OLD.dba
			,OLD.eb_primary_sic
			,OLD.pc_primary_sic
			,OLD.pc_second_sic
			,OLD.pc_tertiary_sic
			,OLD.other_subsidiaries
			,OLD.pc_client_profile
			,OLD.eb_client_profile
			,OLD.eb_account_classification
			,OLD.client_rev_25k
			,OLD.revenue_range
			,OLD.ein
			,OLD.naics_description
			,OLD.web_url
			,OLD.parent_account
			,OLD.primary_contact
			,OLD.account_owner
			,OLD.status_code
			,OLD.status_reason
			,OLD.total_rewards_producer
			,OLD.guid
			,'D';
	RETURN OLD;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_account_d() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_account_d() TO rl_powerapps_x;
GO