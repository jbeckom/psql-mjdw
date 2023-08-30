DROP FUNCTION IF EXISTS powerapps.sp_sagitta_account_upsert(int);
GO 

CREATE OR REPLACE FUNCTION powerapps.sp_account_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO powerapps.account (
		 account_source
		,source_key
		,account_name
		,client_code
		,client_category
		,pc_client_category
		,medical_funding_type
		,enrolled_employees
		,bor_dt
		,erisa_info
		,stop_loss_renew_dt
		,benefit_plan_change_effective_date
		,industry
		,dba
		,eb_primary_sic
		,pc_primary_sic
		,pc_second_sic
		,pc_tertiary_sic
		,other_subsidiaries
		,pc_client_profile
		,eb_client_profile
		,eb_account_classification
		,client_rev_25k
		,revenue_range
		,ein
		,naics_description
		,web_url
		,parent_account
		,primary_contact
		,account_owner
		,status_code
		,status_reason
		,modify_dt
		,is_dirty
	)
	SELECT distinct 
			 account_source
			,source_key
			,account_name
			,client_code
			,client_category
			,pc_client_category
			,medical_funding_type
			,enrolled_employees::int
			,bor_dt::date
			,erisa_info
			,stop_loss_renew_dt::date
			,benefit_plan_change_effective_date::date
			,industry
			,dba
			,eb_primary_sic
			,pc_primary_sic
			,pc_second_sic
			,pc_tertiary_sic
			,other_subsidiaries
			,pc_client_profile
			,eb_client_profile
			,eb_account_classification
			,client_rev_25k
			,revenue_range
			,ein
			,naics_description
			,web_url
			,parent_account
			,primary_contact
			,account_owner
			,status_code
			,status_reason
			,modify_dt
			,TRUE 
	FROM 	powerapps.stg_account 
	ON CONFLICT (account_source,source_key) DO UPDATE 
	SET 	 account_name 							= excluded.account_name
			,client_code 							= excluded.client_code
			,client_category 						= excluded.client_category
			,pc_client_category 					= excluded.pc_client_category
			,medical_funding_type 					= excluded.medical_funding_type
			,enrolled_employees 					= excluded.enrolled_employees
			,bor_dt 								= excluded.bor_dt
			,erisa_info 							= excluded.erisa_info
			,stop_loss_renew_dt 					= excluded.stop_loss_renew_dt
			,benefit_plan_change_effective_date 	= excluded.benefit_plan_change_effective_date
			,industry 								= excluded.industry
			,dba 									= excluded.dba
			,eb_primary_sic 						= excluded.eb_primary_sic
			,pc_primary_sic 						= excluded.pc_primary_sic
			,pc_second_sic 							= excluded.pc_second_sic
			,pc_tertiary_sic 						= excluded.pc_tertiary_sic
			,other_subsidiaries 					= excluded.other_subsidiaries
			,pc_client_profile 						= excluded.pc_client_profile
			,eb_client_profile 						= excluded.eb_client_profile
			,eb_account_classification 				= excluded.eb_account_classification
			,client_rev_25k 						= excluded.client_rev_25k
			,revenue_range 							= excluded.revenue_range
			,ein 									= excluded.ein
			,naics_description 						= excluded.naics_description
			,web_url 								= excluded.web_url
			,parent_account 						= excluded.parent_account
			,primary_contact 						= excluded.primary_contact
			,account_owner 							= excluded.account_owner
			,status_code 							= excluded.status_code
			,status_reason 							= excluded.status_reason
			,modify_dt 								= excluded.modify_dt
			,is_dirty 								= TRUE 
	WHERE 	(account.account_name,account.client_code,account.client_category,account.pc_client_category,account.medical_funding_type,account.enrolled_employees,account.bor_dt,account.erisa_info,account.stop_loss_renew_dt,account.benefit_plan_change_effective_date,account.industry,account.dba,account.eb_primary_sic,account.pc_primary_sic,account.pc_second_sic,account.pc_tertiary_sic,account.other_subsidiaries,account.pc_client_profile,account.eb_client_profile,account.eb_account_classification,account.client_rev_25k,account.revenue_range,account.ein,account.naics_description,account.web_url,account.parent_account,account.primary_contact,account.account_owner,account.status_code,account.status_reason,account.modify_dt) 
		IS DISTINCT FROM 	(excluded.account_name,excluded.client_code,excluded.client_category,excluded.pc_client_category,excluded.medical_funding_type,excluded.enrolled_employees,excluded.bor_dt,excluded.erisa_info,excluded.stop_loss_renew_dt,excluded.benefit_plan_change_effective_date,excluded.industry,excluded.dba,excluded.eb_primary_sic,excluded.pc_primary_sic,excluded.pc_second_sic,excluded.pc_tertiary_sic,excluded.other_subsidiaries,excluded.pc_client_profile,excluded.eb_client_profile,excluded.eb_account_classification,excluded.client_rev_25k,excluded.revenue_range,excluded.ein,excluded.naics_description,excluded.web_url,excluded.parent_account,excluded.primary_contact,excluded.account_owner,excluded.status_code,excluded.status_reason,excluded.modify_dt);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION powerapps.sp_account_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION powerapps.sp_account_upsert() TO rl_powerapps_x;
GO 
