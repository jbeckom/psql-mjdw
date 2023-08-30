CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_hired_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_hired_info (
		 sagitem 
		,lis 
		,old_hired_liability_class_cd 
		,old_hired_location_agency_id 
		,old_hired_state_prov_cd 
		,old_hired_liability_cost_amt 
		,old_hired_liability_rate 
		,old_hired_physical_damage_rate 
		,old_hired_liability_minimum_yes_no_cd 
		,old_hired_num_vehs  
		,old_hired_comprehensive_deductible_amt  
		,old_hired_specified_perils_deductible_amt  
		,old_hired_collision_deductible_amt  
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.hired_liability_class_cd 
			,OLD.hired_location_agency_id 
			,OLD.hired_state_prov_cd 
			,OLD.hired_liability_cost_amt 
			,OLD.hired_liability_rate 
			,OLD.hired_physical_damage_rate 
			,OLD.hired_liability_minimum_yes_no_cd 
			,OLD.hired_num_vehs  
			,OLD.hired_comprehensive_deductible_amt  
			,OLD.hired_specified_perils_deductible_amt  
			,OLD.hired_collision_deductible_amt  
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_hired_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_hired_info_d() TO rl_sagitta_x;
GO 
