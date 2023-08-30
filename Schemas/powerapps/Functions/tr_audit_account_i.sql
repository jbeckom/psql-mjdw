CREATE OR REPLACE FUNCTION powerapps.tr_audit_account_i ()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO powerapps.audit_account (
		 account_source 
		,source_key 
		,new_account_name 
		,new_client_code 
		,new_client_category 
		,new_pc_client_category
		,new_medical_funding_type
		,new_enrolled_employees
		,new_bor_dt
		,new_erisa_info
		,new_stop_loss_renew_dt
		,new_industry
		,new_dba
		,new_eb_primary_sic
		,new_pc_primary_sic
		,new_pc_second_sic
		,new_pc_tertiary_sic
		,new_other_subsidiaries
		,new_pc_client_profile
		,new_eb_client_profile
		,new_eb_account_classification
		,new_client_rev_25k
		,new_revenue_range
		,new_ein
		,new_naics_description
		,new_web_url
		,new_parent_account
		,new_primary_contact
		,new_account_owner
		,new_status_code
		,new_status_reason
		,new_total_rewards_producer
		,guid
		,audit_action
	)
	SELECT 	 NEW.account_source 
			,NEW.source_key 
			,NEW.account_name 
			,NEW.client_code 
			,NEW.client_category 
			,NEW.pc_client_category
			,NEW.medical_funding_type
			,NEW.enrolled_employees
			,NEW.bor_dt
			,NEW.erisa_info
			,NEW.stop_loss_renew_dt
			,NEW.industry
			,NEW.dba
			,NEW.eb_primary_sic
			,NEW.pc_primary_sic
			,NEW.pc_second_sic
			,NEW.pc_tertiary_sic
			,NEW.other_subsidiaries
			,NEW.pc_client_profile
			,NEW.eb_client_profile
			,NEW.eb_account_classification
			,NEW.client_rev_25k
			,NEW.revenue_range
			,NEW.ein
			,NEW.naics_description
			,NEW.web_url
			,NEW.parent_account
			,NEW.primary_contact
			,NEW.account_owner
			,NEW.status_code
			,NEW.status_reason
			,NEW.total_rewards_producer
			,NEW.guid
			,'I';
	RETURN NEW;
END;
$$;
GO

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.tr_audit_account_i() OWNER TO mj_admin;
GO

GRANT EXECUTE ON FUNCTION powerapps.tr_audit_account_i() TO rl_powerapps_x;
GO