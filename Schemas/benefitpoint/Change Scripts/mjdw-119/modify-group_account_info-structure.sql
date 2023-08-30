/******************/
/*** DATA TYPES ***/
/******************/
ALTER TABLE benefitpoint.group_account_info 
	 ALTER COLUMN market_size SET DATA TYPE TEXT USING market_size::TEXT
	,ALTER COLUMN business_type SET DATA TYPE TEXT USING business_type::TEXT 
	,ALTER COLUMN requires_5500 SET DATA TYPE bool USING (nullif(requires_5500,'None_Selected')::TEXT)::bool;
GO 

ALTER TABLE benefitpoint.audit_brokerage_account_info 
	 ALTER COLUMN old_hipaa_required SET DATA TYPE bool USING (nullif(old_hipaa_required,'None_Selected')::TEXT)::bool
	,ALTER COLUMN new_hipaa_required SET DATA TYPE bool USING (nullif(new_hipaa_required,'None_Selected')::TEXT)::bool;
GO 

ALTER TABLE benefitpoint.audit_group_account_info
	 ALTER COLUMN old_requires_5500 SET DATA TYPE bool USING (nullif(old_requires_5500,'None_Selected')::TEXT)::bool
	,ALTER COLUMN new_requires_5500 SET DATA TYPE bool USING (nullif(new_requires_5500,'None_Selected')::TEXT)::bool;
GO 

ALTER TABLE benefitpoint.brokerage_account_info
	ALTER COLUMN hipaa_required SET DATA TYPE bool USING (nullif(hipaa_required,'None_Selected')::TEXT)::bool;
GO 

DROP TYPE IF EXISTS benefitpoint.optional_boolean;
GO 

/****************/
/*** FUNCTION ***/
/****************/
DROP FUNCTION IF EXISTS benefitpoint.sp_group_account_info_upsert(int,text);
GO 

CREATE OR REPLACE FUNCTION benefitpoint.sp_group_account_info_upsert()
RETURNS int 
LANGUAGE plpgsql 
AS $$

DECLARE rc int;

BEGIN 
	INSERT INTO benefitpoint.group_account_info (
		 account_id
		,account_name
		,dba
		,number_of_ftes
		,number_of_ftes_as_of
		,number_of_full_time_equivalents
		,number_of_full_time_equivalents_as_of_date
		,coverage_subject_to_employer_mandate
		,market_size
		,business_type
		,sic_code
		,naics_code
		,requires_5500
		,locations_by_zip
		,affiliates
		,budgeted_total_annual_premium 
		,budgeted_total_annual_revenue 
		,multiple_payroll_cycles
		,multiple_payroll_cycles_differ_by
		,single_payroll_cycle
	)
	SELECT   account_id
			,account_name
			,dba
			,number_of_ftes
			,number_of_ftes_as_of
			,number_of_full_time_equivalents
			,number_of_full_time_equivalents_as_of_date
			,coverage_subject_to_employer_mandate
			,market_size
			,business_type
			,sic_code
			,naics_code
			,requires_5500
			,locations_by_zip
			,affiliates
			,budgeted_total_annual_premium::double PRECISION 
			,budgeted_total_annual_revenue::double PRECISION 
			,multiple_payroll_cycles::bool
			,multiple_payroll_cycles_differ_by
			,single_payroll_cycle
	FROM 	benefitpoint.stg_group_account_info 
	ON CONFLICT (account_id) DO UPDATE 
	SET 	 account_name 									= excluded.account_name
			,dba 											= excluded.dba
			,number_of_ftes 								= excluded.number_of_ftes
			,number_of_ftes_as_of 							= excluded.number_of_ftes_as_of
			,number_of_full_time_equivalents 				= excluded.number_of_full_time_equivalents
			,number_of_full_time_equivalents_as_of_date 	= excluded.number_of_full_time_equivalents_as_of_date
			,coverage_subject_to_employer_mandate 			= excluded.coverage_subject_to_employer_mandate
			,market_size 									= excluded.market_size
			,business_type 									= excluded.business_type
			,sic_code 										= excluded.sic_code
			,naics_code 									= excluded.naics_code
			,requires_5500 									= excluded.requires_5500
			,locations_by_zip 								= excluded.locations_by_zip
			,affiliates 									= excluded.affiliates
			,budgeted_total_annual_premium 					= excluded.budgeted_total_annual_premium
			,budgeted_total_annual_revenue 					= excluded.budgeted_total_annual_revenue
			,multiple_payroll_cycles 						= excluded.multiple_payroll_cycles
			,multiple_payroll_cycles_differ_by 				= excluded.multiple_payroll_cycles_differ_by
			,single_payroll_cycle 							= excluded.single_payroll_cycle
	WHERE 	(group_account_info.account_name,group_account_info.dba,group_account_info.number_of_ftes,group_account_info.number_of_ftes_as_of,group_account_info.number_of_full_time_equivalents,group_account_info.number_of_full_time_equivalents_as_of_date,group_account_info.coverage_subject_to_employer_mandate,group_account_info.market_size,group_account_info.business_type,group_account_info.sic_code,group_account_info.naics_code,group_account_info.requires_5500,group_account_info.locations_by_zip,group_account_info.affiliates,group_account_info.budgeted_total_annual_premium,group_account_info.budgeted_total_annual_revenue,group_account_info.multiple_payroll_cycles,group_account_info.multiple_payroll_cycles_differ_by,group_account_info.single_payroll_cycle) 
		IS DISTINCT FROM 	(excluded.account_name,excluded.dba,excluded.number_of_ftes,excluded.number_of_ftes_as_of,excluded.number_of_full_time_equivalents,excluded.number_of_full_time_equivalents_as_of_date,excluded.coverage_subject_to_employer_mandate,excluded.market_size,excluded.business_type,excluded.sic_code,excluded.naics_code,excluded.requires_5500,excluded.locations_by_zip,excluded.affiliates,excluded.budgeted_total_annual_premium,excluded.budgeted_total_annual_revenue,excluded.multiple_payroll_cycles,excluded.multiple_payroll_cycles_differ_by,excluded.single_payroll_cycle);
	
	GET DIAGNOSTICS rc = row_count;

	RETURN 	rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION benefitpoint.sp_group_account_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION benefitpoint.sp_group_account_info_upsert() TO rl_benefitpoint_x;
GO 
