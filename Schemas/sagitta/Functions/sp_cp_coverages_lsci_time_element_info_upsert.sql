CREATE OR REPLACE FUNCTION sagitta.sp_cp_coverages_lsci_time_element_info_upsert() 
RETURNS int 
LANGUAGE plpgsql 
AS $$ 

DECLARE rc int;

BEGIN 
	INSERT INTO sagitta.cp_coverages_lsci_time_element_info (
		 sagitem 
		,lis 
		,time_element_subject_insurance_cd 
		,time_element_subject_insurance_desc 
		,time_element_monthy_limit 
		,time_element_num_days 
		,time_element_floor_area_num_units 
		,time_element_manufacturing_area_num_units 
		,time_element_mercantile_area_num_units 
		,time_element_option_cd 
		,time_element_limit_on_loss_cd 
		,time_element_payroll_cd 
		,time_element_payroll_amt 
		,time_element_num_extension_business_income_days 
		,time_element_maximum_indemnity_period 
	)
	SELECT 	 sagitem 
			,lis 
			,time_element_subject_insurance_cd 
			,time_element_subject_insurance_desc 
			,time_element_monthy_limit 
			,time_element_num_days 
			,time_element_floor_area_num_units 
			,time_element_manufacturing_area_num_units 
			,time_element_mercantile_area_num_units 
			,time_element_option_cd 
			,time_element_limit_on_loss_cd 
			,time_element_payroll_cd 
			,time_element_payroll_amt 
			,time_element_num_extension_business_income_days 
			,time_element_maximum_indemnity_period 
	FROM 	sagitta.stg_cp_coverages_lsci_time_element_info
	ON CONFLICT (sagitem,lis) DO UPDATE 
	SET 	 time_element_subject_insurance_cd 					= excluded.time_element_subject_insurance_cd 
			,time_element_subject_insurance_desc 				= excluded.time_element_subject_insurance_desc 
			,time_element_monthy_limit 							= excluded.time_element_monthy_limit 
			,time_element_num_days 								= excluded.time_element_num_days 
			,time_element_floor_area_num_units 					= excluded.time_element_floor_area_num_units 
			,time_element_manufacturing_area_num_units 			= excluded.time_element_manufacturing_area_num_units 
			,time_element_mercantile_area_num_units 			= excluded.time_element_mercantile_area_num_units 
			,time_element_option_cd 							= excluded.time_element_option_cd 
			,time_element_limit_on_loss_cd 						= excluded.time_element_limit_on_loss_cd 
			,time_element_payroll_cd 							= excluded.time_element_payroll_cd 
			,time_element_payroll_amt 							= excluded.time_element_payroll_amt 
			,time_element_num_extension_business_income_days 	= excluded.time_element_num_extension_business_income_days 
			,time_element_maximum_indemnity_period 				= excluded.time_element_maximum_indemnity_period 
	WHERE 	(cp_coverages_lsci_time_element_info.time_element_subject_insurance_cd,cp_coverages_lsci_time_element_info.time_element_subject_insurance_desc,cp_coverages_lsci_time_element_info.time_element_monthy_limit,cp_coverages_lsci_time_element_info.time_element_num_days,cp_coverages_lsci_time_element_info.time_element_floor_area_num_units,cp_coverages_lsci_time_element_info.time_element_manufacturing_area_num_units,cp_coverages_lsci_time_element_info.time_element_mercantile_area_num_units,cp_coverages_lsci_time_element_info.time_element_option_cd,cp_coverages_lsci_time_element_info.time_element_limit_on_loss_cd,cp_coverages_lsci_time_element_info.time_element_payroll_cd,cp_coverages_lsci_time_element_info.time_element_payroll_amt,cp_coverages_lsci_time_element_info.time_element_num_extension_business_income_days,cp_coverages_lsci_time_element_info.time_element_maximum_indemnity_period) 
		IS DISTINCT FROM 	(excluded.time_element_subject_insurance_cd,excluded.time_element_subject_insurance_desc,excluded.time_element_monthy_limit,excluded.time_element_num_days,excluded.time_element_floor_area_num_units,excluded.time_element_manufacturing_area_num_units,excluded.time_element_mercantile_area_num_units,excluded.time_element_option_cd,excluded.time_element_limit_on_loss_cd,excluded.time_element_payroll_cd,excluded.time_element_payroll_amt,excluded.time_element_num_extension_business_income_days,excluded.time_element_maximum_indemnity_period); 
	
	GET DIAGNOSTICS rc = row_count;

	RETURN rc;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.sp_cp_coverages_lsci_time_element_info_upsert() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.sp_cp_coverages_lsci_time_element_info_upsert() TO rl_sagitta_x;
GO 
