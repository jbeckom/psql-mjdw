CREATE OR REPLACE FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_d() 
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$ 

BEGIN 
	INSERT INTO sagitta.audit_eq_coverages_unscheduled_equipment_info (
		 sagitem 
		,lis 
		,old_unsch_equip_desc 
		,old_unscheduled_equip_coins_pct 
		,old_num_unscheduled_equip_max_item 
		,old_unscheduled_equipm_insurance_amt 
		,audit_action
	)
	SELECT 	 OLD.sagitem 
			,OLD.lis 
			,OLD.unsch_equip_desc 
			,OLD.unscheduled_equip_coins_pct 
			,OLD.num_unscheduled_equip_max_item 
			,OLD.unscheduled_equipm_insurance_amt 
			,'D';
	RETURN OLD;
END;
$$;
GO 

/*** PERMISSIONS ***/
ALTER FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_d() OWNER TO mj_admin;
GO 

GRANT EXECUTE ON FUNCTION sagitta.tr_audit_eq_coverages_unscheduled_equipment_info_d() TO rl_sagitta_x;
GO 