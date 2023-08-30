CREATE OR REPLACE FUNCTION sagitta.tr_audit_ba_coverages_hired_info_i() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO sagitta.audit_ba_coverages_hired_info (
		 sagitem 
		,lis 
		,new_hired_liability_class_cd 
		,new_hired_location_agency_id 
		,new_hired_state_prov_cd 
		,new_hired_liability_cost_amt 
		,new_hired_liability_rate 
		,new_hired_physical_damage_rate 
		,new_hired_liability_minimum_yes_no_cd 
		,new_hired_num_vehs  
		,new_hired_comprehensive_deductible_amt  
		,new_hired_specified_perils_deductible_amt  
		,new_hired_collision_deductible_amt
		,audit_action
	)
	SELECT 	 NEW.sagitem 
			,NEW.lis 
			,NEW.hired_liability_class_cd 
			,NEW.hired_location_agency_id 
			,NEW.hired_state_prov_cd 
			,NEW.hired_liability_cost_amt 
			,NEW.hired_liability_rate 
			,NEW.hired_physical_damage_rate 
			,NEW.hired_liability_minimum_yes_no_cd 
			,NEW.hired_num_vehs  
			,NEW.hired_comprehensive_deductible_amt  
			,NEW.hired_specified_perils_deductible_amt  
			,NEW.hired_collision_deductible_amt 
			,'I';
	RETURN NEW;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_ba_coverages_hired_info_i() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_ba_coverages_hired_info_i() TO rl_sagitta_x;
GO 
