CREATE OR REPLACE FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_cp_coverages_lsci_time_element_info (
		 sagitem 
		,lis 
		,new_time_element_subject_insurance_cd 
		,new_time_element_subject_insurance_desc 
		,new_time_element_monthy_limit 
		,new_time_element_num_days 
		,new_time_element_floor_area_num_units 
		,new_time_element_manufacturing_area_num_units 
		,new_time_element_mercantile_area_num_units 
		,new_time_element_option_cd 
		,new_time_element_limit_on_loss_cd 
		,new_time_element_payroll_cd 
		,new_time_element_payroll_amt 
		,new_time_element_num_extension_business_income_days 
		,new_time_element_maximum_indemnity_period 
		,audit_action 
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.time_element_subject_insurance_cd 
			,NEW.time_element_subject_insurance_desc 
			,NEW.time_element_monthy_limit 
			,NEW.time_element_num_days 
			,NEW.time_element_floor_area_num_units 
			,NEW.time_element_manufacturing_area_num_units 
			,NEW.time_element_mercantile_area_num_units 
			,NEW.time_element_option_cd 
			,NEW.time_element_limit_on_loss_cd 
			,NEW.time_element_payroll_cd 
			,NEW.time_element_payroll_amt 
			,NEW.time_element_num_extension_business_income_days 
			,NEW.time_element_maximum_indemnity_period 
			,'I';
	RETURN NEW;
END;
$$ 
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_cp_coverages_lsci_time_element_info_i() TO rl_sagitta_x;
GO 
